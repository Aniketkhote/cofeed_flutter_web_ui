import 'package:cofeed/constant.dart';
import 'package:cofeed/models/User.dart';
import 'package:cofeed/widgets/label_text.dart';
import 'package:cofeed/widgets/username_text.dart';
import 'package:flutter/material.dart';

class RightSidebar extends StatefulWidget {
  @override
  _RightSidebarState createState() => _RightSidebarState();
}

class _RightSidebarState extends State<RightSidebar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 350,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.black12, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            navigation(),
            suggestion(),
            latestPost(),
            links(),
          ],
        ),
      ),
    );
  }

  Widget navigation() {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Icon(
              Icons.cloud_upload,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget suggestion() {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabelText(label: 'Suggestions For You'),
              Text(
                'See All',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: suggestedUsers.length,
            itemBuilder: (context, index) {
              return SuggestionItem(
                url: suggestedUsers[index].imageUrl,
                name: suggestedUsers[index].name,
                username: suggestedUsers[index].username,
                isFollow: suggestedUsers[index].isFollow,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget latestPost() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label: 'Latest Post Activity'),
          singleLatestPost(),
        ],
      ),
    );
  }

  Widget singleLatestPost() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                latestPostImage(),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(label: 'Minimalist\nStairs'),
                    SizedBox(height: 20),
                    postActionButtons(),
                  ],
                )
              ],
            ),
          ),
          Text(
            'See All Posts',
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget latestPostImage() {
    return Container(
      width: 130,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://hgtvhome.sndimg.com/content/dam/images/hgtv/fullset/2012/8/15/1/DP_Barry-Block-Cottage-Outdoor-Stone-Staircase-2_s4x3.jpg.rend.hgtvcom.966.725.suffix/1400977788609.jpeg'),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreenAccent[400].withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget links() {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {},
            child: Text(
              'About',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w400),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Help',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w400),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Terms',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w400),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Popular',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w400),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Language',
              style: TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SuggestionItem extends StatefulWidget {
  String url;
  String name;
  String username;
  bool isFollow;

  SuggestionItem({Key key, this.url, this.name, this.username, this.isFollow})
      : super(key: key);

  @override
  _SuggestionItemState createState() => _SuggestionItemState();
}

class _SuggestionItemState extends State<SuggestionItem> {
  bool isFollw;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.url),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(label: widget.name),
                  UsernameText(
                    text: widget.username,
                  )
                ],
              ),
            ],
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                widget.isFollow = !widget.isFollow;
              });
            },
            color: !widget.isFollow ? kPrimaryColor : null,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black12, width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              !widget.isFollow ? 'Follow' : 'Followed',
              style: TextStyle(
                color: !widget.isFollow ? Colors.white : Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget postActionButtons() {
  return Row(
    children: [
      likeButton(),
      SizedBox(width: 5),
      commentButton(),
      SizedBox(width: 5),
      saveButton(),
    ],
  );
}

Widget likeButton() {
  return InkWell(
    onTap: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.local_fire_department,
          color: Colors.red,
          size: 20,
        ),
        Text(
          '27',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ],
    ),
  );
}

Widget commentButton() {
  return InkWell(
    onTap: () {},
    child: Row(
      children: [
        Icon(
          Icons.comment,
          size: 20,
        ),
        Text('12'),
      ],
    ),
  );
}

Widget saveButton() {
  return InkWell(
    onTap: () {},
    child: Row(
      children: [
        Icon(
          Icons.bookmark,
          size: 20,
        ),
        Text('8'),
      ],
    ),
  );
}
