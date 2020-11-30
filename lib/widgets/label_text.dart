import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;

  const LabelText({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
