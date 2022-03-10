import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldtime = WorldTime(location: 'Berlin', url: 'Europe/Berlin', flag: 'germany.png');
    await worldtime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldtime.location,
      'time': worldtime.time,
      'flag': worldtime.flag,
      'isDayTime': worldtime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: SpinKitRing(
          color: Colors.grey,
          size: 50.0,
        ),
      ),
    );
  }
}