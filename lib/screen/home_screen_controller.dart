import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:calacrate_flick2_app/admob/admob_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class HomeScreenController extends GetxController {
  //計算履歴のすべて　＝＞          途中式　＝ 答え
  var listItem = [].obs;

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
  String expression = '';

  var expression2 = ''.obs;

  //計算をする際にListからStringに変換するためのString
  String _exp = '';

  String _expp = '';

  //途中式 ＝ 計算結果のためのString
  String _exp2 = '';

  String _exp3 = '';

  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addPostFrameCallback((_) => initPlugin());
    loadAd();
    print(listItem.length);
  }

  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  late BannerAd banner;

  void loadAd() {
    final adState = Provider.of<AdState>(Get.context!);
    adState.initialization.then((status) {
      banner = BannerAd(
        adUnitId: adState.bannerAdUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: adState.adListener,
      )..load();
    });
  }

  void numClick(
    String text,
    int button,
  ) {
    switch (button) {
      case 1:
        //数字のボタン
        HapticFeedback.lightImpact();
        break;
      case 2:
        //１タップした時
        HapticFeedback.lightImpact();
        break;
      case 3:
        HapticFeedback.lightImpact();
        break;
      default:
        break;
    }

    if (text == "√") {
      //表示用 =>                  _historyの中身　（表示のため）
      cal2.add('√');
      //計算                       _historyの中身　（計算のため）
      cal.add('sqrt');
      expression = cal.join('');
      expression2.value = cal2.join('');
    } else {
      //表示用 =>                  _historyの中身　（表示のため）
      cal2.add(text);
      //計算                       _historyの中身　（計算のため）
      cal.add(text);
      expression = cal.join('');
      expression2.value = cal2.join('');
    }
  }

  void substitution(String text) {
    //TODO 代入した際に、計算（裏）と計算(表)の２つそれぞれ代入しなければならない。
    //  print('計算裏' + text);
    cal.add(text);
    expression = cal.join('');
  }

  void substitution2(String text) {
    //TODO 計算（表）

    // print('計算表' + text);
    cal2.add(text);
    expression2.value = cal2.join('');
  }

  void delete() {
    if (cal.length != 0) {
      //配列ができた。。。
      cal.removeAt(cal.length - 1);
      cal2.removeAt(cal2.length - 1);
      // print(cal);
      // print(cal2);
      expression = cal.join('');
      expression2.value = cal2.join('');
    }
  }

  void allClear() {
    cal.clear();
    cal2.clear();
    expression = cal2.join('');
    expression2.value = cal.join('');
    listItem.clear();
    listItem2.clear();
    listItem3.clear();
    listItem4.clear();
    listItem5.clear();
  }

  void clear() {
    cal.clear();
    cal2.clear();
    expression = cal2.join('');
    expression2.value = cal.join('');

    print(expression2.value);
  }

  void evaluate() {
    if (cal.length != 0) {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      //TODO 計算の配列をString型に直す。
      _exp = cal.join('');

      _expp = cal2.join('');
      //print(_expp);
      // print(_exp); // 9*9
      _exp2 = _expp; // 9*9の途中式専用

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
      expression = '';
      //_expression2 = '';
      expression2.value = _exp;
      _exp = '';
      _expp = '';
      _exp2 = '';
      _exp3 = '';
      cal.clear();
      cal2.clear();
    }
  }

  void action() {
    Get.back();
  }
}
