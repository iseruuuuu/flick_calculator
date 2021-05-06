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
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalcApp(),
    );
  }
}

class CalcApp extends StatefulWidget {
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
  String _history7 = '';
  String _history8 = '';
  String _history9 = '';
  String _history10 = '';
  String _history11 = '';
  String _history12 = '';

  String _expression = '';
  double fontSize = 20;
  int ontap = 1;

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void delete () {
    setState(() {
      if (_expression.length == 0) {

      }else {
        var pos = _expression.length - ontap;
        final result = _expression.substring(0, pos);
        _expression = result;
      }
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
      _history7 = '';
      _history8 = '';
      _history9 = '';
      _history10 = '';
      _history11 = '';
      _history12 = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    if (_expression.length == 0) {

    }else{
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      setState(() {
        _history12 = _history11;
        _history11 = _history10;
        _history10 = _history9;
        _history9 = _history8;
        _history8 = _history7;
        _history7 = _history6;
        _history6 = _history5;
        _history5 = _history4;
        _history4 = _history3;
        _history3 = _history2;
        _history2 = _history;
        _history = _expression;
        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xDD000000),
        body: SwipeGestureRecognizer(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                  height: deviceHeight * 0.22,
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              _history12,
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
                              _history11,
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
                              _history10,
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
                              _history9,
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
                              _history8,
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
                              _history7,
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
                      ],
                    ),
                  ),
                ),



                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5 ,bottom: 5),
                    child: Text(
                      _expression,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 40,
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
                      textSize: 32,
                      callback: clear,
                    ),
                    CalcButton(
                      text: '%',
                      fillColor: 0xff888888,
                      textColor: 0xFF000000,
                      textSize: 40,
                      callback: numClick,
                    ),
                    Container(
                      margin: EdgeInsets.all(6),
                      child: SizedBox(
                        width: 75,
                        height: 75,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            delete();
                          },
                          child: Text('⌫',
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontSize: 65,
                              ),
                            ),
                          ),
                          color: Color(0xff888888),
                          textColor: Color(0xFF000000),
                        ),
                      ),
                    ),

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
                      text: '=',
                      textSize: 60,
                      fillColor: 0xFFFF6F00,
                      textColor: 0xFFFFFFFF,
                      callback: evaluate,
                    ),
                  ],
                )
              ],
            ),
          ),
          onSwipeLeft: () {
            numClick('-');
          },
          onSwipeRight: () {
            numClick('+');
          },
          onSwipeUp: () {
            numClick('*');
          },
          onSwipeDown: () {
            numClick('/');
          },
        ),
      ),
    );
  }
}