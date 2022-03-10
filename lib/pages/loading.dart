import 'package:flutter/material.dart';
import 'package:flutter_world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  //const Loading({ Key? key }) : super(key: key);

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
      'flag': worldtime.flag
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
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Text('loading...'),
      ),
    );
  }
}