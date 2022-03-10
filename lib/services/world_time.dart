import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;

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

      // Set time property
      time = now.toString();
    }
    catch (e) {
      print('error $e');
      time = 'Could not get time data';
    }
  }
}