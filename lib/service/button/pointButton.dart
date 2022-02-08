import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PointButton extends StatelessWidget {
  const PointButton({
    Key? key,
    required this.text,
    this.textSize = 28,
    required this.callback,
  }) : super(key: key);

  final String text;
  final double textSize;
  final Function() callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 2, right: 0, left: 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        child: Theme(
          data: ThemeData(splashColor: Colors.white),
          child: Material(
            elevation: 0,
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: InkWell(
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
                color: Color(0xff424242),
                textColor: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
