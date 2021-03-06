import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'Egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'Kenya.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'Nigeria.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'South-Korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'Indonesia.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'Japan.png'),
    WorldTime(
        url: 'America/Chicago', location: 'Chicago', flag: 'United-States.png'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag: 'United-States.png'),
    WorldTime(
        url: 'America/Los_Angeles',
        location: 'Los Angeles',
        flag: 'United-States.png'),
    WorldTime(
        url: 'Australia/Sydney', location: 'Sydney', flag: 'Australia.png'),
    WorldTime(
        url: 'Europe/London', location: 'London', flag: 'United-Kingdom.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'Greece.png'),
    WorldTime(url: 'Europe/Vilnius', location: 'Vilnius', flag: 'Lithuania.png')
  ];

  void updateTime(index) async {
    WorldTime worldtime = locations[index];
    await worldtime.getTime();
    Navigator.pop(context, {
      'location': worldtime.location,
      'time': worldtime.time,
      'flag': worldtime.flag,
      'isDayTime': worldtime.isDayTime
    });
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    return index > 0
        ? oldString.substring(0, index) +
            newChar +
            oldString.substring(index + 1)
        : oldString;
  }

  String getCountry(String flag) {
    return replaceCharAt(flag.substring(0, flag.length - 4),
        flag.substring(0, flag.length - 4).indexOf('-'), ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 1.0,
              horizontal: 4.0,
            ),
            child: Card(
              color: Colors.grey[900],
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location +
                      ', ' +
                      getCountry(locations[index].flag),
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.zero),
                  child: Image.asset('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
