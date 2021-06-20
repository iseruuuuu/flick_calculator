//import 'package:admob_flutter/admob_flutter.dart';
//import 'package:app_tracking_transparency/app_tracking_transparency.dart';
//import 'package:calacreate_flick3_app/Test15_31/admob.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:calacrate_flick2_app/widgets/CalcButton.dart';
import 'package:calacrate_flick2_app/widgets/admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:holding_gesture/holding_gesture.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:holding_gesture/holding_gesture.dart';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';
import 'CalcButton3.dart';
import 'CalcButton3222.dart';
//import '../CalacButton.dart';
//import '../CalacButton3.dart';



class MyApp7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalcApp7(),
    );
  }
}

class CalcApp7 extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp7> {

  double fontSize = 20;
  int onTap = 1;
  bool isNumber = false;

  //計算履歴のすべて　＝＞          途中式　＝ 答え
  List<String> listItem = [];
  //計算履歴　＝＞              途中式 　  sqrt 3
  List<String> listItem2 = [];
  //() をつけた計算履歴         （途中式）  (sqrt 3)
  List<String> listItem3 = [];

  List<String> listItem4 = []; // 途中式  √3

  List<String> listItem5 = []; // (途中式) (√３)


  //表示用 =>                  _historyの中身　（表示のため）
  List<String> cal2 = [];

  //計算                       _historyの中身　（計算のため）
  List<String> cal = [];

  //途中式を記載するためのString
  String _expression = '';

  String _expression2 = '';

  //計算をする際にListからStringに変換するためのString
  String _exp = '';

  String _expp = '';

  //途中式 ＝ 計算結果のためのString
  String _exp2 = '';

  String _exp3 = '';


  String _authStatus = 'Unknown';
  @override
  void initState() {
    super.initState();
    // Can't show a dialog in initState, delaying initialization
    // WidgetsBinding.instance.addPostFrameCallback((_) => initPlugin());
  }
  /*
  Future<void> initPlugin() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final TrackingStatus status =
      await AppTrackingTransparency.trackingAuthorizationStatus;
      setState(() => _authStatus = '$status');
      // If the system can show an authorization request dialog
      if (status == TrackingStatus.notDetermined) {
        // Show a custom explainer dialog before the system dialog
        if (await showCustomTrackingDialog(context)) {
          // Wait for dialog popping animation
          await Future.delayed(const Duration(milliseconds: 200));
          // Request system's tracking authorization dialog
          final TrackingStatus status =
          await AppTrackingTransparency.requestTrackingAuthorization();
          setState(() => _authStatus = '$status');
        }
      }
    } on PlatformException {
      setState(() => _authStatus = 'PlatformException was thrown');
    }
    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    print("UUID: $uuid");
  }
  Future<bool> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Thank You For\n'
              ' Downloading 🎉',style: TextStyle(color: Colors.green,fontSize: 30),),
          content: const Text(
            'あなたが興味を引くような広告を設定することができます。\n'
                'アプリを使いやすくするために\n'
                'ご協力よろしくお願いします。',style: TextStyle(fontSize: 15),
          ),
          actions: [
            Divider(color: Colors.black,height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('了解です',style: TextStyle(fontSize: 20),),
                ),
              ],
            ),
          ],
        ),
      ) ??
          false;

   */

  void numClick(String text) {
    setState(() {
      if (text == "√") {
        //表示用 =>                  _historyの中身　（表示のため）
        cal2.add('√');
        //計算                       _historyの中身　（計算のため）
        cal.add('sqrt');
        _expression = cal.join('');
        _expression2 = cal2.join('');
      }else{
        //表示用 =>                  _historyの中身　（表示のため）
        cal2.add(text);
        //計算                       _historyの中身　（計算のため）
        cal.add(text);
        _expression = cal.join('');
        _expression2 = cal2.join('');
      }
    });
  }
  void substitution(String text) {
    setState(() {
      //TODO 代入した際に、計算（裏）と計算(表)の２つそれぞれ代入しなければならない。
      //  print('計算裏' + text);
      cal.add(text);
      _expression = cal.join('');
    });
  }

  void substitution2(String text) {
    //TODO 計算（表）
    setState(() {
      // print('計算表' + text);
      cal2.add(text);
      _expression2 = cal2.join('');
    });
  }


  void delete () {
    setState(() {
      //配列ができた。。。
      cal.removeAt(cal.length -1);
      cal2.removeAt(cal2.length -1);
      // print(cal);
      // print(cal2);
      _expression = cal.join('');
      _expression2 = cal2.join('');
    });
  }
  void allClear(String text) {
    setState(() {
      cal.clear();
      cal2.clear();
      _expression = cal2.join('');
      _expression2 = cal.join('');
      listItem.clear();
      listItem2.clear();
      listItem3.clear();
      listItem4.clear();
      listItem5.clear();
    });
  }
  void clear(String text) {
    setState(() {
      cal.clear();
      cal2.clear();
      _expression = cal2.join('');
      _expression2 = cal.join('');
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      //TODO 計算の配列をString型に直す。
      _exp = cal.join('');

      _expp = cal2.join('');
      //print(_expp);
      // print(_exp); // 9*9
      _exp2 =  _expp; // 9*9の途中式専用

      // TODO ①(途中式)  ② 途中式  ③計算結果
      // ①
      listItem3.add('(' + _exp + ')');
      // print(listItem3);//[(99*9)]
      listItem5.add('(' + _expp + ')');
      // print(listItem5);
      // ②
      listItem2.add(_exp);

      listItem4.add(_expp);
      // print(listItem2);//[99*9]
      //   print(listItem4);
      // ③
      _exp = exp.evaluate(EvaluationType.REAL, cm).toString();
      //　途中式　＝　結果

      //_exp2　を見かけの計算にする。
      _exp3 = _exp2 + ' = ' + _exp;
      //  print(_exp3);//

      listItem.add(_exp3);
      //print(listItem);// 9/9=1.0
      _expression = '';
      //_expression2 = '';
      _expression2 = _exp;
      _exp = '';
      _expp = '';
      _exp2 = '';
      _exp3 = '';
      cal.clear();
      cal2.clear();
    });
  }
  void blank(String text){}

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final double width = MediaQuery.of(context).size.width * 0.18;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xDD000000),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AdmobBanner(
                adUnitId: AdMobService().getBannerAdUnitId(),
                adSize: AdmobBannerSize(
                  width: MediaQuery.of(context).size.width.toInt(),
                  height: AdMobService().getHeight(context).toInt(),
                  name: 'SMART_BANNER',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: listItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      actionExtentRatio: 0.2,
                      actionPane: SlidableScrollActionPane(),
                      // 左側に表示するWidget
                      actions: <Widget>[
                        IconSlideAction(
                          caption: '式を代入',
                          color: Colors.yellow,
                          icon: Icons.archive_outlined,
                          onTap: () {
                            substitution(listItem2[index]);
                            substitution2(listItem4[index]);
                          },
                        ),
                        IconSlideAction(
                          caption: '（式)を代入',
                          color: Colors.blue,
                          icon: Icons.archive,
                          onTap: () {
                            substitution(listItem3[index]);
                            substitution2(listItem5[index]);
                          },
                        ),
                      ],
                      secondaryActions: [
                        IconSlideAction(
                          caption: '削除',
                          color: Colors.red,
                          icon: Icons.restore_from_trash,
                          onTap: () {
                            // toDoList.remove(data);
                            setState(() {
                              listItem.removeAt(index);
                              listItem2.removeAt(index);
                              listItem3.removeAt(index);
                              listItem4.removeAt(index);
                              listItem5.removeAt(index);
                            });
                          },
                        ),
                      ],
                      child: Card(
                        child: Container(
                          width: deviceHeight * 0.9,
                          child: Text(' ' + listItem[index], style: TextStyle(color:Colors.black,fontSize: 25),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(color: Colors.white, height: 20,thickness: 3,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0 ,bottom: 0),
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    child: Text(
                      _expression2,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),


              Container(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalcButton1(
                      text: 'AC',
                      fillColor: 0xff888888,
                      textColor: 0xFF000000,
                      //textSize: 25,
                      textSize: 28,
                      callback: Dialog,
                    ),
                    SwipeGestureRecognizer(
                      child: CalcButton(
                        text: 'C',
                        fillColor: 0xff888888,
                        textColor: 0xFF000000,
                        textSize: 32,
                        callback: clear,
                      ),
                      onSwipeUp: () {
                        numClick('sin');
                      },
                      onSwipeRight: () {
                        numClick('cos');
                      },
                      onSwipeLeft: (){
                        numClick('tan');
                      },
                    ),
                    SwipeGestureRecognizer(
                      child: CalcButton(
                        text: '%',
                        fillColor: 0xff888888,
                        textColor: 0xFF000000,
                        textSize: 40,
                        callback: numClick,
                      ),
                      onSwipeLeft: () {
                        numClick('(');
                      },
                      onSwipeRight: () {
                        numClick(')');
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1,bottom: 1,right: 0,left: 0),
                      child: SizedBox(
                        width: 73,
                        height: 73,
                        //width: 65,
                        //height: 65,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          onPressed: () {
                            delete();
                          },
                          child: Text('⌫',
                            style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                fontSize: 60,
                                // fontSize: 50,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '7',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '8',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '9',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '4',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '5',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '6',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '1',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '2',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                  GestureDetector(
                    child: SwipeGestureRecognizer(
                      child: CalcButton(
                        text: '3',
                        textSize: 40,
                        fillColor: 0xff424242,
                        textColor: 0xFFFFFFFF,
                        callback: numClick,
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
                    onLongPress: () {
                      print(pow(2,4));
                      //longTap('3');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SwipeGestureRecognizer(
                    child: CalcButton(
                      text: '0',
                      textSize: 40,
                      fillColor: 0xff424242,
                      textColor: 0xFFFFFFFF,
                      callback: numClick,
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
                  CalcButton(
                    text: '.',
                    textSize: 40,
                    fillColor: 0xff424242,
                    textColor: 0xFFFFFFFF,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '=',
                    textSize: 40,
                    fillColor: 0xFFFF6F00,
                    textColor: 0xFFFFFFFF,
                    callback: evaluate,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names, missing_return
  Widget Dialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text('削除確認', textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
          content: Text('計算や履歴が削除されます\n'
              'よろしいでしょうか？',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
          actions: [
            Divider(color: Colors.black,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('いいえ', style: TextStyle(color: Colors.blue, fontSize: 20,),
                    ),
                  ),
                ),
                Container(height: 50, width: 1, child: VerticalDivider(color: Colors.black,),),
                CalcButton3222(
                  text: 'はい',
                  textColor: 0xFF1E88E5,
                  textSize: 20,
                  callback: allClear,
                  callback2: action,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void action () {
    Navigator.pop(context);
  }
}