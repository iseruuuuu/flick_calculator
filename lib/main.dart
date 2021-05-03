import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import './widgets/CalcButton.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固/
  ]);
  runApp(CalcApp());
  //runApp(SwipeApp());
  //runApp(Swipeable());
  //runApp(SwipeGesture());
}

//TODO 文字を1文字戻したい
//TODO 履歴を少し残したい(今のところ、6列)

//TODO たまに履歴が変になる
//TODO 文字数を変更したい


class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _history2 = '';
  String _history3 = '';
  String _history4 = '';
  String _history5 = '';
  String _history6 = '';
  String _expression = '';
  double fontSize = 20;

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void textDelete(String text) {

    print(_expression.length);
    print(_expression);
    //final result = _expression.length -1 ;
    setState(() {
      _expression = _expression ;
      // _expression.length -1;
      //_expression = _expression.substring(0,result);
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _history2 = '';
      _history3 = '';
      _history4 = '';
      _history5 = '';
      _history6 = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history6 = _history5;
      _history5 = _history4;
      _history4 = _history3;
      _history3 = _history2;
      _history2 = _history;
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: Scaffold(
        backgroundColor: Color(0xDD000000),
        body: SwipeGestureRecognizer(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history6,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history5,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history4,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history3,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          //color: Color(0xFF545F61),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history2,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          //color: Color(0xFF545F61),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),


                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          //color: Color(0xFF545F61),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),


                //TODO 計算TextはListにして邪魔にならないようにする

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5 ,bottom: 5),
                    child: Text(
                      _expression,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      overflow: TextOverflow.fade,
                      maxLines: 1,

                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: 'AC',
                      fillColor: 0xff888888,
                      textColor: 0xFF000000,
                      textSize: 32,
                      callback: allClear,
                    ),
                    CalcButton(
                      text: 'C',
                      fillColor: 0xff888888,
                      textColor: 0xFF000000,
                      textSize: 40,
                      callback: textDelete,
                      //callback: clear,
                    ),

                    CalcButton(
                      text: '%',
                      fillColor: 0xff888888,
                      textColor: 0xFF000000,
                      textSize: 40,
                      callback: numClick,
                    ),

                    CalcButton(
                      text: '=',
                      textSize: 60,
                      fillColor: 0xFFFF6F00,
                      textColor: 0xFFFFFFFF,
                      callback: evaluate,
                    ),


                    /*
                    CalcButton(
                      text: '/',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      callback: numClick,
                    ),
                     */
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '7',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '8',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '9',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    /*
                    CalcButton(
                      text: '*',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      textSize: 24,
                      callback: numClick,
                    ),
                     */
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '4',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '5',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '6',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    /*
                    CalcButton(
                      text: '-',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      textSize: 38,
                      callback: numClick,
                    ),
                     */
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '1',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '2',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '3',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    /*
                    CalcButton(
                      text: '+',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      textSize: 30,
                      callback: numClick,
                    ),
                     */
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton(
                      text: '.',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '0',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                    ),
                    CalcButton(
                      text: '00',
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
                      textSize: 33,
                    ),
                    /*
                    CalcButton(
                      text: '=',
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF65BDAC,
                      callback: evaluate,
                    ),
                     */
                  ],
                )
              ],
            ),
          ),

          onSwipeLeft: () {
            // DO STUFF WHEN LEFT SWIPE GESTURE DETECTED
            numClick('-');
          },
          onSwipeRight: () {
            // DO STUFF WHEN LEFT SWIPE GESTURE DETECTED
            numClick('+');
          },
          onSwipeUp: () {
            // DO STUFF WHEN UP SWIPE GESTURE DETECTED
            numClick('*');
          },
          onSwipeDown: () {
            // DO STUFF WHEN UP SWIPE GESTURE DETECTED
            numClick('/');
          },
        ),
      ),
    );
  }
}