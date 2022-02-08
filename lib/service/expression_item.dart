import 'package:flutter/material.dart';

class ExpressionItem extends StatelessWidget {
  const ExpressionItem({
    Key? key,
    required this.expression,
  }) : super(key: key);

  final String expression;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {},
        child: Text(
          expression,
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
          overflow: TextOverflow.fade,
          maxLines: 2,
        ),
      ),
      alignment: Alignment(1.0, 1.0),
    );
  }
}
