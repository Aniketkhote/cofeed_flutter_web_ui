import 'package:cofeed/widgets/content_body/content_body.dart';
import 'package:cofeed/widgets/left_sidebar/left_sidebar.dart';
import 'package:cofeed/widgets/right_sidebar/right_sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFDFE3EC),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LeftSidebar(),
            ContentBody(),
            RightSidebar(),
          ],
        ),
      ),
    );
  }
}
