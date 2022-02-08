import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogButton extends StatelessWidget {
  final String text;
  final int? fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  final Function callback2;

  const DialogButton({
    Key? key,
    required this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    required this.callback,
    required this.callback2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 2, right: 0, left: 0),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          callback(text);
          callback2();
        },
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
        ),
        color: fillColor != null ? Color(fillColor!) : null,
        textColor: Color(textColor),
      ),
    );
  }
}

/*class CalcButton32 extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalcButton32({
    Key key,
    this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 2,bottom: 2,right: 0,left: 0),
      //   width: deviceWidth * 0.08,
      // height: deviceHeight * 0.09,
      width: 65,
      height: 65,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius .circular(20),
        ),
        onPressed: () {
          callback(text);
          HapticFeedback.heavyImpact();
        },
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ),
        color: fillColor != null ? Color(fillColor) : null,
        textColor: Color(textColor),
      ),
    );
  }
}







//TODO ダイアログのためのボタン

class CalcButton322 extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalcButton322({
    Key key,
    this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 2,bottom: 2,right: 0,left: 0),
      // width: deviceWidth * 0.08,
      // height: deviceHeight * 0.09,
      width: 65,
      height: 65,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius .circular(20),
        ),
        onPressed: () {
          callback(text);
        },
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
        ),
        color: fillColor != null ? Color(fillColor) : null,
        textColor: Color(textColor),
      ),
    );
  }
}



 */
