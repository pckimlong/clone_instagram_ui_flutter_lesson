import 'package:clone_ig/assets/mock_data/current_user-data.dart';
import 'package:clone_ig/pages/profile_page.dart';
import 'package:flutter/material.dart';

import 'circle_profile_widget.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_box_outlined),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
            iconSize: 30,
          ),
          InkWell(
            onTap: () => _myProfilePage(context),
            child: ProfileCircleWidget(user: myProfile, radius: 36),
          ),
        ],
      ),
    );
  }

  void _myProfilePage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProfilePage(user: myProfile)));
  }
}
