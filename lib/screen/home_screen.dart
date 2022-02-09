import 'package:calacrate_flick2_app/screen/home_screen_controller.dart';
import 'package:calacrate_flick2_app/service/button/ac_button.dart';
import 'package:calacrate_flick2_app/service/button/delete_button.dart';
import 'package:calacrate_flick2_app/service/button/equal_button.dart';
import 'package:calacrate_flick2_app/service/text/expression_text.dart';
import 'package:calacrate_flick2_app/service/button/menu_button.dart';
import 'package:calacrate_flick2_app/service/button/number_calc_button.dart';
import 'package:calacrate_flick2_app/service/button/other_button.dart';
import 'package:calacrate_flick2_app/service/button/pointButton.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:four_swipe_direction/four_swipe_direction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(HomeScreenController(), tag: '');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xDD000000),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(19),
          child: AppBar(
            backgroundColor: Color(0xDD000000),
            actions: [MenuButton()],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Container(
              //   height: 50,
              //   child: AdWidget(ad: banner),
              // ),

              // AdmobBanner(
              //   adUnitId: AdMobService().getBannerAdUnitId(),
              //   adSize: AdmobBannerSize(
              //     width: MediaQuery.of(context).size.width.toInt(),
              //     height: AdMobService().getHeight(context).toInt(),
              //     name: 'SMART_BANNER',
              //   ),
              //),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    reverse: true,
                    itemCount: controller.listItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        // actionExtentRatio: 0.2,
                        // actionPane: SlidableScrollActionPane(),
                        // // 左側に表示するWidget
                        // actions: <Widget>[
                        //   IconSlideAction(
                        //     caption: '式を代入',
                        //     color: Colors.yellow,
                        //     icon: Icons.archive_outlined,
                        //     onTap: () {
                        //       substitution(listItem2[index]);
                        //       substitution2(listItem4[index]);
                        //     },
                        //   ),
                        //   IconSlideAction(
                        //     caption: '（式)を代入',
                        //     color: Colors.blue,
                        //     icon: Icons.archive,
                        //     onTap: () {
                        //       substitution(listItem3[index]);
                        //       substitution2(listItem5[index]);
                        //     },
                        //   ),
                        // ],
                        // secondaryActions: [
                        //   IconSlideAction(
                        //     caption: '削除',
                        //     color: Colors.red,
                        //     icon: Icons.restore_from_trash,
                        //     onTap: () {
                        //       // toDoList.remove(data);
                        //       setState(() {
                        //         listItem.removeAt(index);
                        //         listItem2.removeAt(index);
                        //         listItem3.removeAt(index);
                        //         listItem4.removeAt(index);
                        //         listItem5.removeAt(index);
                        //       });
                        //     },
                        //   ),
                        // ],
                        child: Card(
                          child: Container(
                            width: deviceHeight * 0.9,
                            child: Text(
                              ' ' + controller.listItem[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Divider(color: Colors.white, height: 20, thickness: 5),
              Obx(() =>
                  ExpressionText(expression: controller.expression2.value)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ACButton(
                    text: 'AC',
                    textSize: deviceWidth / 12.5,
                    callback: () => controller.allClear(),
                  ),
                  OtherButton(
                    text: 'C',
                    textSize: MediaQuery.of(context).size.width / 10,
                    callback: () => controller.clear(),
                    swipeUp: () => controller.numClick('sin', 2),
                    swipeLeft: () => controller.numClick('tan', 2),
                    swipeRight: () => controller.numClick('cos', 2),
                  ),
                  OtherButton(
                    text: '%',
                    textSize: MediaQuery.of(context).size.width / 10,
                    callback: () => controller.numClick('%', 2),
                    swipeLeft: () => controller.numClick('(', 2),
                    swipeRight: () => controller.numClick(')', 2),
                  ),
                  DeleteButton(
                    onHold: () {
                      controller.delete();
                      HapticFeedback.mediumImpact();
                    },
                    onTap: () {
                      controller.delete();
                      HapticFeedback.selectionClick();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NumberCalcButton(
                    text: '7',
                    textSize: MediaQuery.of(context).size.width / 8,
                    callback: () => controller.numClick('7', 2),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                  NumberCalcButton(
                    text: '8',
                    textSize: MediaQuery.of(context).size.width / 8,
                    callback: () => controller.numClick('8', 2),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                  NumberCalcButton(
                    text: '9',
                    textSize: MediaQuery.of(context).size.width / 8,
                    callback: () => controller.numClick('9', 2),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NumberCalcButton(
                    text: '4',
                    textSize: MediaQuery.of(context).size.width / 8,
                    callback: () => controller.numClick('4', 2),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                  NumberCalcButton(
                    text: '5',
                    textSize: MediaQuery.of(context).size.width / 8,
                    callback: () => controller.numClick('5', 2),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                  NumberCalcButton(
                    text: '6',
                    textSize: MediaQuery.of(context).size.width / 8,
                    callback: () => controller.numClick('6', 2),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NumberCalcButton(
                    text: '1',
                    textSize: MediaQuery.of(context).size.width / 8,
                    callback: () => controller.numClick('1', 2),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                  NumberCalcButton(
                    text: '2',
                    //textSize: 40,
                    textSize: MediaQuery.of(context).size.width / 8,
                    callback: () => controller.numClick('2', 2),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                  GestureDetector(
                    child: NumberCalcButton(
                      text: '3',
                      textSize: MediaQuery.of(context).size.width / 8,
                      callback: () => controller.numClick('3', 2),
                      swipeLeft: () => controller.numClick('-', 1),
                      swipeRight: () => controller.numClick('+', 1),
                      swipeUp: () => controller.numClick('*', 1),
                      swipeDown: () => controller.numClick('/', 1),
                    ),
                    onLongPress: () {
                      //longTap('3');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FourSwipeDirection(
                    child: NumberCalcButton(
                      text: '0',
                      textSize: MediaQuery.of(context).size.width / 8,
                      callback: () => controller.numClick('0', 2),
                    ),
                    swipeLeft: () => controller.numClick('-', 1),
                    swipeRight: () => controller.numClick('+', 1),
                    swipeUp: () => controller.numClick('*', 1),
                    swipeDown: () => controller.numClick('/', 1),
                  ),
                  PointButton(
                    text: '.',
                    callback: () => controller.numClick('.', 2),
                  ),
                  EqualButton(
                    text: '=',
                    callback: () => controller.evaluate(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
