import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';

class c_CupertinoContextMenu extends StatelessWidget {
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
      home: Hc_CupertinoContextMenu(),
    );
  }
}

class Hc_CupertinoContextMenu extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<Hc_CupertinoContextMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoContextMenu'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoContextMenu(
              child: Container(
                alignment: Alignment.center,
                child: SwipeGestureRecognizer(
                  onSwipeLeft: () {
                    print('-');
                  },
                  onSwipeRight: () {
                    print('+');
                  },
                  onSwipeUp: () {
                    print('*');
                  },
                  onSwipeDown: () {
                    print('/');
                  },
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                color: Colors.red,
                height: 60,
                width: 60,
              ),
              actions: <Widget>[
                CupertinoContextMenuAction(
                  child: const Text('+'),
                  onPressed: () {
                   print('+');
                   Navigator.pop(context);
                  },
                ),
                CupertinoContextMenuAction(
                  child: const Text('-'),
                  onPressed: () {
                    print('-');
                    Navigator.pop(context);
                  },
                ),
                CupertinoContextMenuAction(
                  child: const Text('✖︎'),
                  onPressed: () {
                    print('*');
                    Navigator.pop(context);
                  },
                ),
                CupertinoContextMenuAction(
                  child: const Text('➗'),
                  onPressed: () {
                    print('/');
                    Navigator.pop(context);
                  },
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}