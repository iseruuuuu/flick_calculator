import 'package:flutter/material.dart';
import 'package:holding_gesture/holding_gesture.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.onHold,
    required this.onTap,
  }) : super(key: key);

  final Function() onHold;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1, bottom: 1, right: 0, left: 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        height: MediaQuery.of(context).size.width / 5,
        child: HoldDetector(
          onHold: onHold,
          child: Theme(
            data: ThemeData(splashColor: Colors.white),
            child: Material(
              elevation: 0,
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: onTap,
                child: Text(
                  '⌫',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 9,
                    // fontSize: 50,
                  ),
                ),
                color: Color(0xff888888),
                textColor: Color(0xFF000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
