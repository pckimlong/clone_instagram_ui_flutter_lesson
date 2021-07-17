import '../assets/mock_data/current_user-data.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../provider/navigator_provider.dart';
import 'package:flutter/material.dart';

import 'circle_profile_widget.dart';
import 'package:provider/provider.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => _homePage(context),
            icon: _buildHomeBotton(context),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileCircleWidget(user: myProfile, radius: 36),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeBotton(BuildContext context) {
    final page = context.watch<NavigateProvider>().initPage;
    if (page == IgPage.home) {
      return Icon(Icons.home);
    } else {
      return Icon(Icons.home_outlined);
    }
  }

  void _myProfilePage(BuildContext context) {
    context.read<NavigateProvider>().changePage(IgPage.profile);
  }

  void _homePage(BuildContext context) {
    context.read<NavigateProvider>().changePage(IgPage.home);
  }
}
