import 'package:flutter/material.dart';

class UsernameText extends StatelessWidget {
  final String text;

  const UsernameText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black54,
        fontSize: 12,
      ),
    );
  }
}
