import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  bool isDayTime = false;

  WorldTime({ required this.location, this.flag = '', required this.url });

  Future<void> getTime() async {
    try {
      // Make request
      Response res = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = json.decode(res.body);
      
      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      
      // Create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 5 && now.hour < 21;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      time = 'Could not get time data';
    }
  }
}