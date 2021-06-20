import 'package:flutter/material.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';




class Gesture extends StatelessWidget {
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
      home: HHHome(),
    );
  }
}

class HHHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<HHHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Swipe To Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: GestureDetector(

                //TODO　長押ししたら、何かを出したい。
                onLongPress: () {
                  print("ロングプレス");
                },

                //四則演算　＝＞　４つ出したい
                onLongPressEnd: (details) => print('ロングプレス終わり'),

                //四則演算
                onHorizontalDragEnd: (details) => print('掛け算or割り算'),
                // onHorizontalDragEnd: (details) =>
                /*
                    SwipeGestureRecognizer(
                  onSwipeRight: () {
                    print("右");
                  },
                    onSwipeLeft: () {
                      print('左');
                    },   ),
                     */

                onVerticalDragEnd: (details) => print('足し算or引き算'),


                // onHorizontalDragStart: (details) => print('ss'),
                onTap: () {
                  //TODO これはtextをうつ
                  print('数字');
                },
                child: Text('sss'),
              ),
            ),

            Spacer(),

            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: SwipeGestureRecognizer(
                child: GestureDetector(
                  /*
                    onLongPress: () {
                      print("長押し");
                    },

                   */
                  onSecondaryTapDown: (details) => print('onSecondaryTapDown()'),

                  // onHorizontalDragEnd: (details) => print('掛け算or割り算'),
                  // onVerticalDragEnd: (details) => print('足し算or引き算'),
                  child: Center(
                    child: Tooltip(
                        message:
                        "　　× 　　\n"
                            "-　　　　　　+\n"
                            "　　　　÷　　　　",
                      textStyle: TextStyle(fontSize: 70),



                        child: Center(
                          child: Text("　　　1　　　\n"
                          "\n"
                              "2　　　　　３\n"
                              "\n"
                              "　　　4　　　",style: TextStyle(),
                          ),
                        ),
                    ),
                  ),
                ),
                onSwipeLeft: () {
                  message == '-';
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
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void check() {
    SwipeGestureRecognizer(
      onSwipeLeft: () {
        print("左");
      },
      onSwipeRight: () {
        print("右");
      },
    );
  }
}