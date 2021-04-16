import 'package:flutter/material.dart';
import 'package:customize/customize.dart';

class LabelText extends StatelessWidget {
  final String label;

  const LabelText({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(label).bold.lg.color(Colors.black);
  }
}
