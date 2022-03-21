import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    // Set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue[700] : Color(0xff1f3249);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    // If result is null, set the new state with the old values
                    dynamic result =
                        await Navigator.pushNamed(context, '/location') ??
                            {
                              'time': data['time'],
                              'location': data['location'],
                              'isDayTime': data['isDayTime'],
                              'flag': data['flag']
                            };

                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    size: 30.0,
                    color: Colors.grey[200],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.w600,
                        fontSize: 28.0,
                        letterSpacing: 4.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: data['time'].contains(new RegExp(r'[0-9]'))
                      ? TextStyle(
                          color: Colors.grey[200],
                          fontSize: 66.0,
                        )
                      : TextStyle(
                          color: Colors.grey[200],
                          fontSize: 26.0,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
