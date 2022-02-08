// import 'package:app_tracking_transparency/app_tracking_transparency.dart';
// import 'package:calacrate_flick2_app/admob/admob_state.dart';
// import 'package:calacrate_flick2_app/service/ac_button.dart';
// import 'package:calacrate_flick2_app/service/delete_button.dart';
// import 'package:calacrate_flick2_app/service/menu_button.dart';
// import 'package:calacrate_flick2_app/service/number_calc_button.dart';
// import 'package:calacrate_flick2_app/service/dialog_button.dart';
// import 'package:calacrate_flick2_app/service/other_button.dart';
// import 'package:calacrate_flick2_app/service/pointButton.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:four_swipe_direction/four_swipe_direction.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:math_expressions/math_expressions.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   HomeScreenState createState() => HomeScreenState();
// }
//
// class HomeScreenState extends State<HomeScreen> {
//   double fontSize = 20;
//   int onTap = 1;
//   bool isNumber = false;
//
//   //計算履歴のすべて　＝＞          途中式　＝ 答え
//   List<String> listItem = [];
//
//   //計算履歴　＝＞              途中式 　  sqrt 3
//   List<String> listItem2 = [];
//
//   //() をつけた計算履歴         （途中式）  (sqrt 3)
//   List<String> listItem3 = [];
//
//   List<String> listItem4 = []; // 途中式  √3
//
//   List<String> listItem5 = []; // (途中式) (√３)
//
//   //表示用 =>                  _historyの中身　（表示のため）
//   List<String> cal2 = [];
//
//   //計算                       _historyの中身　（計算のため）
//   List<String> cal = [];
//
//   //途中式を記載するためのString
//   String _expression = '';
//
//   String _expression2 = '';
//
//   //計算をする際にListからStringに変換するためのString
//   String _exp = '';
//
//   String _expp = '';
//
//   //途中式 ＝ 計算結果のためのString
//   String _exp2 = '';
//
//   String _exp3 = '';
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addPostFrameCallback((_) => initPlugin());
//   }
//
//   Future<void> initPlugin() async {
//     final status = await AppTrackingTransparency.trackingAuthorizationStatus;
//     if (status == TrackingStatus.notDetermined) {
//       await Future.delayed(const Duration(milliseconds: 200));
//       await AppTrackingTransparency.requestTrackingAuthorization();
//     }
//   }
//
//   late BannerAd banner;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final adState = Provider.of<AdState>(context);
//     adState.initialization.then((status) {
//       setState(() {
//         banner = BannerAd(
//           adUnitId: adState.bannerAdUnitId,
//           size: AdSize.banner,
//           request: const AdRequest(),
//           listener: adState.adListener,
//         )..load();
//       });
//     });
//   }
//
//   void numClick(String text) {
//     setState(() {
//       if (text == "√") {
//         //表示用 =>                  _historyの中身　（表示のため）
//         cal2.add('√');
//         //計算                       _historyの中身　（計算のため）
//         cal.add('sqrt');
//         _expression = cal.join('');
//         _expression2 = cal2.join('');
//       } else {
//         //表示用 =>                  _historyの中身　（表示のため）
//         cal2.add(text);
//         //計算                       _historyの中身　（計算のため）
//         cal.add(text);
//         _expression = cal.join('');
//         _expression2 = cal2.join('');
//       }
//     });
//   }
//
//   void substitution(String text) {
//     setState(() {
//       //TODO 代入した際に、計算（裏）と計算(表)の２つそれぞれ代入しなければならない。
//       //  print('計算裏' + text);
//       cal.add(text);
//       _expression = cal.join('');
//     });
//   }
//
//   void substitution2(String text) {
//     //TODO 計算（表）
//     setState(() {
//       // print('計算表' + text);
//       cal2.add(text);
//       _expression2 = cal2.join('');
//     });
//   }
//
//   void delete() {
//     setState(() {
//       //配列ができた。。。
//       cal.removeAt(cal.length - 1);
//       cal2.removeAt(cal2.length - 1);
//       // print(cal);
//       // print(cal2);
//       _expression = cal.join('');
//       _expression2 = cal2.join('');
//     });
//   }
//
//   void allClear(String text) {
//     setState(() {
//       cal.clear();
//       cal2.clear();
//       _expression = cal2.join('');
//       _expression2 = cal.join('');
//       listItem.clear();
//       listItem2.clear();
//       listItem3.clear();
//       listItem4.clear();
//       listItem5.clear();
//     });
//   }
//
//   void clear(String text) {
//     setState(() {
//       cal.clear();
//       cal2.clear();
//       _expression = cal2.join('');
//       _expression2 = cal.join('');
//     });
//   }
//
//   void evaluate(String text) {
//     Parser p = Parser();
//     Expression exp = p.parse(_expression);
//     ContextModel cm = ContextModel();
//     setState(() {
//       //TODO 計算の配列をString型に直す。
//       _exp = cal.join('');
//
//       _expp = cal2.join('');
//       //print(_expp);
//       // print(_exp); // 9*9
//       _exp2 = _expp; // 9*9の途中式専用
//
//       // TODO ①(途中式)  ② 途中式  ③計算結果
//       // ①
//       listItem3.add('(' + _exp + ')');
//       // print(listItem3);//[(99*9)]
//       listItem5.add('(' + _expp + ')');
//       // print(listItem5);
//       // ②
//       listItem2.add(_exp);
//
//       listItem4.add(_expp);
//       // print(listItem2);//[99*9]
//       //   print(listItem4);
//       // ③
//       _exp = exp.evaluate(EvaluationType.REAL, cm).toString();
//       //　途中式　＝　結果
//
//       //_exp2　を見かけの計算にする。
//       _exp3 = _exp2 + ' = ' + _exp;
//       //  print(_exp3);//
//
//       listItem.add(_exp3);
//       //print(listItem);// 9/9=1.0
//       _expression = '';
//       //_expression2 = '';
//       _expression2 = _exp;
//       _exp = '';
//       _expp = '';
//       _exp2 = '';
//       _exp3 = '';
//       cal.clear();
//       cal2.clear();
//     });
//   }
//
//   void onTapAC() {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(32.0))),
//           title: Text(
//             '削除確認',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 20),
//           ),
//           content: Text(
//             '計算や履歴が削除されます\n' 'よろしいでしょうか？',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 15),
//           ),
//           actions: [
//             Divider(
//               color: Colors.black,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   child: FlatButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       'いいえ',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: 50,
//                   width: 1,
//                   child: VerticalDivider(
//                     color: Colors.black,
//                   ),
//                 ),
//                 DialogButton(
//                   text: 'はい',
//                   textColor: 0xFF1E88E5,
//                   textSize: 20,
//                   callback: allClear,
//                   callback2: action,
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void action() {
//     Navigator.pop(context);
//   }
//
//   void blank(String text) {}
//
//   @override
//   Widget build(BuildContext context) {
//     final double deviceHeight = MediaQuery.of(context).size.height;
//     final double deviceWidth = MediaQuery.of(context).size.width;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Color(0xDD000000),
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(19),
//           child: AppBar(
//             backgroundColor: Color(0xDD000000),
//             actions: [MenuButton()],
//           ),
//         ),
//         body: Container(
//           padding: EdgeInsets.all(12),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               Container(
//                 height: 50,
//                 child: AdWidget(ad: banner),
//               ),
//               // AdmobBanner(
//               //   adUnitId: AdMobService().getBannerAdUnitId(),
//               //   adSize: AdmobBannerSize(
//               //     width: MediaQuery.of(context).size.width.toInt(),
//               //     height: AdMobService().getHeight(context).toInt(),
//               //     name: 'SMART_BANNER',
//               //   ),
//               //),
//               Expanded(
//                 child: ListView.builder(
//                   reverse: true,
//                   itemCount: listItem.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Slidable(
//                       // actionExtentRatio: 0.2,
//                       // actionPane: SlidableScrollActionPane(),
//                       // // 左側に表示するWidget
//                       // actions: <Widget>[
//                       //   IconSlideAction(
//                       //     caption: '式を代入',
//                       //     color: Colors.yellow,
//                       //     icon: Icons.archive_outlined,
//                       //     onTap: () {
//                       //       substitution(listItem2[index]);
//                       //       substitution2(listItem4[index]);
//                       //     },
//                       //   ),
//                       //   IconSlideAction(
//                       //     caption: '（式)を代入',
//                       //     color: Colors.blue,
//                       //     icon: Icons.archive,
//                       //     onTap: () {
//                       //       substitution(listItem3[index]);
//                       //       substitution2(listItem5[index]);
//                       //     },
//                       //   ),
//                       // ],
//                       // secondaryActions: [
//                       //   IconSlideAction(
//                       //     caption: '削除',
//                       //     color: Colors.red,
//                       //     icon: Icons.restore_from_trash,
//                       //     onTap: () {
//                       //       // toDoList.remove(data);
//                       //       setState(() {
//                       //         listItem.removeAt(index);
//                       //         listItem2.removeAt(index);
//                       //         listItem3.removeAt(index);
//                       //         listItem4.removeAt(index);
//                       //         listItem5.removeAt(index);
//                       //       });
//                       //     },
//                       //   ),
//                       // ],
//                       child: Card(
//                         child: Container(
//                           width: deviceHeight * 0.9,
//                           child: Text(
//                             ' ' + listItem[index],
//                             style: TextStyle(color: Colors.black, fontSize: 20),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               // Divider(color: Colors.white, height: 20, thickness: 3,),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 0, bottom: 0),
//                   child: FlatButton(
//                     padding: EdgeInsets.all(0),
//                     onPressed: () {},
//                     child: Text(
//                       _expression2,
//                       style: TextStyle(
//                         fontSize: 30,
//                         color: Colors.white,
//                       ),
//                       overflow: TextOverflow.fade,
//                       maxLines: 2,
//                     ),
//                   ),
//                 ),
//                 alignment: Alignment(1.0, 1.0),
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     ACButton(
//                       text: 'AC',
//                       textSize: deviceWidth / 12.5,
//                       callback: onTapAC,
//                     ),
//                     FourSwipeDirection(
//                       child: OtherButton(
//                         text: 'C',
//                         textSize: MediaQuery.of(context).size.width / 10,
//                         callback: clear,
//                       ),
//                       swipeUp: () => numClick('sin'),
//                       swipeLeft: () => numClick('tan'),
//                       swipeRight: () => numClick('cos'),
//                     ),
//                     FourSwipeDirection(
//                       child: OtherButton(
//                         text: '%',
//                         textSize: MediaQuery.of(context).size.width / 10,
//                         callback: numClick,
//                       ),
//                       swipeLeft: () => numClick('('),
//                       swipeRight: () => numClick(')'),
//                     ),
//                     DeleteButton(
//                       onHold: () {
//                         delete();
//                         HapticFeedback.mediumImpact();
//                       },
//                       onTap: () {
//                         delete();
//                         HapticFeedback.selectionClick();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '7',
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '8',
//                       //textSize: 40,
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '9',
//                       //textSize: 40,
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '4',
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '5',
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '6',
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '1',
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '2',
//                       //textSize: 40,
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                   GestureDetector(
//                     child: FourSwipeDirection(
//                       child: NumberCalcButton(
//                         text: '3',
//                         textSize: MediaQuery.of(context).size.width / 8,
//                         callback: numClick,
//                       ),
//                       swipeLeft: () {
//                         numClick('-');
//                         HapticFeedback.heavyImpact();
//                       },
//                       swipeRight: () {
//                         numClick('+');
//                         HapticFeedback.heavyImpact();
//                       },
//                       swipeUp: () {
//                         numClick('*');
//                         HapticFeedback.heavyImpact();
//                       },
//                       swipeDown: () {
//                         numClick('/');
//                         HapticFeedback.heavyImpact();
//                       },
//                     ),
//                     onLongPress: () {
//                       //longTap('3');
//                     },
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   FourSwipeDirection(
//                     child: NumberCalcButton(
//                       text: '0',
//                       textSize: MediaQuery.of(context).size.width / 8,
//                       callback: numClick,
//                     ),
//                     swipeLeft: () {
//                       numClick('-');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeRight: () {
//                       numClick('+');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeUp: () {
//                       numClick('*');
//                       HapticFeedback.heavyImpact();
//                     },
//                     swipeDown: () {
//                       numClick('/');
//                       HapticFeedback.heavyImpact();
//                     },
//                   ),
//                   PointButton(text: '.', callback: numClick),
//                   NumberCalcButton(
//                     text: '=',
//                     textSize: MediaQuery.of(context).size.width / 8,
//                     callback: evaluate,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
