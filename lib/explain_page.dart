import 'package:calacrate_flick2_app/example/swipe_gesture_recognizer.dart';
import 'package:calacrate_flick2_app/widgets/CalcButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';

class ExplainPage extends StatefulWidget {
  const ExplainPage({Key key}) : super(key: key);

  @override
  _ExplainPageState createState() => _ExplainPageState();
}

class _ExplainPageState extends State<ExplainPage> {

  String _expression = '';
  String _expression2 = '';
  String _expression3 = '';
  String _expression4 = '';
  String _expression5 = '';


  void number(String text) {
    setState(() {
      _expression = text;
    });
  }

  void number2(String text) {
    setState(() {
      _expression2 = text;
    });
  }

  void number3(String text) {
    setState(() {
      _expression3 = text;
    });
  }

  void number4(String text) {
    setState(() {
      _expression4 = text;
    });
  }

  void number5 (String text) {
    setState(() {
      _expression5 = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xDD000000),
      appBar: AppBar(
        title: Text('操作一覧'),
        backgroundColor: Color(0xDD000000),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Spacer(),
                Text('←', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 60,color: Color(0xFFFFFFFF)))),
                Container(width: 55, height: 55, color: Color(0xff424242),
                    child: Center(child: Text('(', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 20,color: Color(0xFFFFFFFF)))))),
                Container(width: 55, height: 55, color: Color(0xff888888),
                  child: Center(child: SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '%',
                      fillColor: 0xff888888,
                      textColor: 0xFF000000,
                      textSize: 20,
                      callback: number,
                    ),
                    onSwipeLeft: () {
                      number('(');
                    },
                    onSwipeRight: () {
                      number(')');
                    },
                  ),
                  ),
                ),
                Container(width: 55, height: 55, color: Color(0xff424242),
                  child: Center(child: Text(')', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 20,color: Color(0xFFFFFFFF)))),
                  ),),
                Text('→︎', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 60,color: Color(0xFFFFFFFF)))),
                Spacer(),
                Container(width: 55,height: 55,color: Colors.grey,
                    child: Center(child: Text(_expression,style: TextStyle(color: Colors.white,fontSize: 30),))),
                Spacer(),
              ],
            ),


            Row(
              children: [
                Spacer(),
                Column(
                  children: [
                    Text('↑︎', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                    Container(width: 55, height: 55, color: Color(0xff888888),
                      child: Center(child: Text('×︎', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('←︎', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40,color: Color(0xFFFFFFFF)))),
                        Container(width: 55, height: 55, color: Color(0xff888888),
                          child: Center(child: Text('−', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                          ),),
                        Container(width: 55, height: 55, color: Color(0xff424242),
                          child: SwipeGestureRecognizer(
                            child: CalcButton(
                              text: '5',
                              fillColor: 0xff424242,
                              textColor: 0xFF000000,
                              textSize: 40,
                              callback: number2,
                            ),
                            onSwipeLeft: () {
                              number2('-');
                            },
                            onSwipeRight: () {
                              number2('+');
                            },
                            onSwipeUp: () {
                              number2('*');
                            },
                            onSwipeDown: () {
                              number2('/');
                            },
                          ),
                        ),
                        Container(width: 55, height: 55, color: Color(0xff888888),
                          child: Center(child: Text('+', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                          ),),
                        Text('→', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40,color: Color(0xFFFFFFFF)))),
                      ],
                    ),
                    Container(width: 55, height: 55, color: Color(0xff888888),
                      child: Center(child: Text('÷', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                      ),
                    ),
                    Text('↓︎', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                  ],
                ),
                Spacer(),
                Container(width: 55,height: 55,color: Colors.grey,
                    child: Center(child: Text(_expression2,style: TextStyle(color: Colors.white,fontSize: 30),))),
                Spacer(),
              ],
            ),

            Row(
              children: [
                Spacer(),
                Column(
                  children: [
                    Text('↑︎', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                    Container(width: 55, height: 55, color: Color(0xff888888),
                      child: Center(child: Text('sin', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('←', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40,color: Color(0xFFFFFFFF)))),
                        Container(width: 55, height: 55, color: Color(0xff888888),
                          child: Center(child: Text('tan', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                          ),),
                        Container(width: 55, height: 55, color: Color(0xff424242),
                          child: SwipeGestureRecognizer(
                            child: CalcButton(
                              text: 'C',
                              fillColor: 0xff424242,
                              textColor: 0xFF000000,
                              textSize: 35,
                              callback: number5,
                            ),
                            onSwipeLeft: () {
                              number5('tan');
                            },
                            onSwipeRight: () {
                              number5('cos');
                            },
                            onSwipeUp: () {
                              number5('sin');
                            },
                          ),
                        ),
                        Container(width: 55, height: 55, color: Color(0xff888888),
                          child: Center(child: Text('cos', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 30,color: Color(0xFFFFFFFF)))),
                          ),),
                        Text('→', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 40,color: Color(0xFFFFFFFF)))),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Container(width: 55,height: 55,color: Colors.grey,
                    child: Center(child: Text(_expression5,style: TextStyle(color: Colors.white,fontSize: 30),))),
                Spacer(),
              ],
            ),

            Spacer(),

            Row(
              children: [
                Spacer(),
                Container(width: 130, height: 45, color: Color(0xff888888),
                  child: Center(
                    child: GestureDetector(
                      child: Text('2回タップ', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 20,color: Color(0xFFFFFFFF)))),
                      onDoubleTap: () {
                      number3('a + b');
                      },
                    ),
                  ),
                ),
                Spacer(),
                Container(width: 150,height: 45,color: Colors.grey,
                    child: Center(child: Text(_expression3,style: TextStyle(color: Colors.white,fontSize: 30),))),
                Spacer(),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Spacer(),
                Container(width: 130, height: 45, color: Color(0xff888888),
                  child: Center(
                    child: GestureDetector(child: Text('長押し', style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 20,color: Color(0xFFFFFFFF)))),
                      onLongPress: () {
                       number4('(a + b)');
                       print("ss");
                      },
                    ),
                  ),
                ),
                Spacer(),
                Container(width: 150,height: 45,color: Colors.grey,
                    child: Center(child: Text(_expression4,style: TextStyle(color: Colors.white,fontSize: 30),))),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}