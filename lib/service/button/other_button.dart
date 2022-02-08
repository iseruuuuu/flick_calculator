import 'package:flutter/material.dart';
import 'package:four_swipe_direction/four_swipe_direction.dart';

class OtherButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function() callback;
  final Function()? swipeUp;
  final Function()? swipeDown;
  final Function()? swipeRight;
  final Function()? swipeLeft;

  const OtherButton({
    Key? key,
    required this.text,
    required this.textSize,
    required this.callback,
    this.swipeUp,
    this.swipeDown,
    this.swipeRight,
    this.swipeLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return FourSwipeDirection(
      swipeUp: swipeUp,
      swipeDown: swipeDown,
      swipeRight: swipeRight,
      swipeLeft: swipeLeft,
      child: Container(
        margin: EdgeInsets.only(top: 2, bottom: 2, right: 0, left: 0),
        child: SizedBox(
          width: deviceWidth / 5,
          height: deviceWidth / 5,
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
                  child: Text(text, style: TextStyle(fontSize: textSize)),
                  color: Color(0xff888888),
                  textColor: Color(0xFF000000),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
