import 'package:flutter/material.dart';

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
