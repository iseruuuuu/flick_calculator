import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton3 extends StatelessWidget {
  final String text;
  final String text2;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  final Function callback2;

  const CalcButton3({
    Key key,
    this.text,
    this.text2,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    this.callback,
    this.callback2,
  }) : super(key: key);


  @override

  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double width = MediaQuery.of(context).size.width * 0.18;
    return Container(
      margin: EdgeInsets.only(top: 2,bottom: 2,right: 0,left: 0),
      child: SizedBox(
        width: width,
        height: width,
        child: Theme(
          data: ThemeData(splashColor: Colors.black),
          child: Material(
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: InkWell(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius .circular(20),
                ),
                onPressed: () {
                  callback(text);
                },
                onLongPress: () {
                  callback2(text2);
                  HapticFeedback.heavyImpact();
                },
                child: Text(
                  text,
                  style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                      fontSize: textSize,
                    ),
                  ),
                ),
                color: fillColor != null ? Color(fillColor) : null,
                textColor: Color(textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}