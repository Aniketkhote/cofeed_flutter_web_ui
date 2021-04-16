import 'package:flutter/material.dart';
import 'package:customize/customize.dart';

class UsernameText extends StatelessWidget {
  final String text;

  const UsernameText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text).sm.color(Colors.black54);
  }
}
