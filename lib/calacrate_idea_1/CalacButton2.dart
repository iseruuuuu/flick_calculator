import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton2 extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const CalcButton2({
    Key key,
    this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2,bottom: 2,right: 0,left: 0),
      child: SizedBox(
        width: 78,
        height: 78,
        //width: 65,
        //height: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius .circular(20),
          ),
          onPressed: () {
            callback(text);
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
    );
  }
}