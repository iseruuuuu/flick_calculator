import 'package:flutter/material.dart';

class ACButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function() callback;

  const ACButton({
    Key? key,
    required this.text,
    this.textSize = 28,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1, bottom: 1, right: 0, left: 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: callback,
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
          color: Color(0xff888888),
          textColor: Color(0xFF000000),
        ),
      ),
    );
  }
}
