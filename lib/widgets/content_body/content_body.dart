import 'package:cofeed/constant.dart';
import 'package:cofeed/models/Feed.dart';
import 'package:cofeed/models/User.dart';
import 'package:cofeed/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:customize/customize.dart';

class ContentBody extends StatefulWidget {
  @override
  _ContentBodyState createState() => _ContentBodyState();
}

class _ContentBodyState extends State<ContentBody> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              favouritesUsers(),
              divider(),
              tabs(),
              feed(),
            ],
          ),
        ),
      ),
    );
  }

  Widget favouritesUsers() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: favUsers.length,
        itemBuilder: (context, index) {
          return Container(
            padding: FxPadding.pxy(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    radius: 35,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 33,
                      child: index == 0
                          ? Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(favUsers[index].imageUrl),
                                  radius: 30,
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      kPrimaryColor.withOpacity(.7),
                                ),
                                Positioned(
                                  top: 15,
                                  left: 15,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  NetworkImage(favUsers[index].imageUrl),
                              radius: 30,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                index == 0
                    ? LabelText(label: "You")
                    : LabelText(label: favUsers[index].name),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: FxPadding.px20,
      child: Divider(thickness: 1, color: Colors.black12),
    );
  }

  Widget tabs() {
    return Padding(
      padding: FxPadding.p20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LabelText(label: 'Feed'),
          Row(
            children: [
              singleTab(name: 'All', index: 0),
              singleTab(name: 'Following', index: 1),
              singleTab(name: 'Newest', index: 2),
              singleTab(name: 'Popular', index: 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget singleTab({String name, int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: FxPadding.pr12,
        child: Text(
          name,
          style: TextStyle(
            color: (currentIndex == index) ? kPrimaryColor : Colors.blueGrey,
            fontSize: 16,
            fontWeight:
                (currentIndex == index) ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget feed() {
    return Container(
      padding: FxPadding.px20,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: feeds.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              feedImage(index),
              Padding(
                padding: FxPadding.pxy(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    feedUser(index),
                    feedAction(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget feedImage(int index) {
    return Container(
      width: 300,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: FxRadius.radius10,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Image.network(
        feeds[index].feedImageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget feedUser(int index) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            feeds[index].feedUserImageUrl,
          ),
          radius: 15,
        ),
        SizedBox(width: 10),
        LabelText(label: feeds[index].name),
      ],
    );
  }

  Widget feedAction() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [Icon(Icons.local_fire_department), Text('428')],
          ),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Icon(Icons.comment),
              Text('104'),
            ],
          ),
        ),
      ],
    );
  }
}
