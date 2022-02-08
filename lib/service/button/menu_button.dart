import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Center(
                child: Text(
                  "操作一覧",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              content: Image.asset(
                'assets/11.png',
              ),
            );
          },
        );
      },
      icon: Icon(
        Icons.menu,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
