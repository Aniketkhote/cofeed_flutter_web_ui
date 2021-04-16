import 'package:cofeed/constant.dart';
import 'package:cofeed/widgets/username_text.dart';
import 'package:flutter/material.dart';
import 'package:customize/customize.dart';

import '../label_text.dart';

class LeftSidebar extends StatefulWidget {
  @override
  _LeftSidebarState createState() => _LeftSidebarState();
}

class _LeftSidebarState extends State<LeftSidebar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white10,
        padding: FxPadding.pxy(vertical: 30, horizontal: 40),
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logoWidget(),
            menuWidget(),
            accountWidget(),
            appStore(),
          ],
        ),
      ),
    );
  }

  Widget logoWidget() {
    return Text('CoFeed').color(kPrimaryColor.withOpacity(.8)).bold.xl2;
  }

  Widget menuWidget() {
    return Container(
      padding: FxPadding.py32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label: 'Menu'),
          menuItemWidget(icon: Icons.home, name: 'Home', index: 0),
          menuItemWidget(icon: Icons.message, name: 'Messages', index: 1),
          menuItemWidget(icon: Icons.person, name: 'Profile', index: 2),
          menuItemWidget(icon: Icons.bookmark, name: 'Saved Post', index: 3),
          menuItemWidget(icon: Icons.settings, name: 'Setting', index: 4),
        ],
      ),
    );
  }

  Widget accountWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelText(label: 'Account'),
            Icon(Icons.keyboard_arrow_down, color: Colors.black45),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/32.jpg'),
            ),
            SizedBox(width: 15),
            Column(
              children: [
                LabelText(label: 'Michael'),
                UsernameText(
                  text: '@michaelco',
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget appStore() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 20),
      padding: FxPadding.py20,
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(.5),
        borderRadius: FxRadius.radius10,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        children: [
          Text('Get Cofeed\non App Store').color(Colors.white).xl.bold,
          Transform.rotate(
            angle: 50,
            child: Container(
              height: 100,
              padding: FxPadding.pt16,
              child: Image.network(
                  'https://cdn1.iconfinder.com/data/icons/computer-techologies-outline-free/128/ic_iphone_appstore-512.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItemWidget({IconData icon, String name, int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: FxPadding.pt16,
        child: Row(
          children: [
            Icon(
              icon,
              color: (currentIndex == index)
                  ? kPrimaryColor.withOpacity(.7)
                  : Colors.blueGrey[200].withOpacity(.8),
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(
                color: (currentIndex == index)
                    ? kPrimaryColor
                    : Colors.blueGrey[300].withOpacity(.8),
                fontWeight: (currentIndex == index) ? FontWeight.w600 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
