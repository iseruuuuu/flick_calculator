import 'package:flutter/material.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';


import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';


class SwipeGesture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe To Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        iconTheme: IconThemeData(
          color: Colors.blue.shade200,
        ),
      ),
      home: HHome(),
    );
  }
}

class HHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<HHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Swipe To Example'),
      ),
      body: SwipeGestureRecognizer(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.blue,
          child: Center(child: Text('井関')),

        ),

        onSwipeLeft: () {
          // DO STUFF WHEN LEFT SWIPE GESTURE DETECTED
          print('左');
        },
        onSwipeRight: () {
          print('右');
        },

        onSwipeUp: () {
          print('上');
        },

        onSwipeDown: () {
          print('下');
        },
      ),
    );
  }
}