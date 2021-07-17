import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../assets/mock_data/current_user-data.dart';
import '../assets/mock_data/post_data.dart';
import '../assets/mock_data/story_data.dart';
import '../model/story_model.dart';
import '../provider/navigator_provider.dart';
import '../widgets/add_story_button.dart';
import '../widgets/bottom_appbar.dart';
import '../widgets/circle_profile_widget.dart';
import '../widgets/ig_logo.dart';
import '../widgets/post_widget.dart';
import 'profile_page.dart';

enum IgPage { home, profile }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: MyBottomAppBar(),
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final page = context.watch<NavigateProvider>().initPage;

    if (page == IgPage.home) {
      return Column(
        children: [
          _buildCustomAppBar(),
          SizedBox(height: 5),
          _buildPostList(),
        ],
      );
    }
    if (page == IgPage.profile) {
      return ProfilePage(user: myProfile, openAsTab: true);
    }
    return Container();
  }

  Expanded _buildPostList() {
    return Expanded(
      child: ListView.builder(
        itemCount: allPosts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return _buildStoryBar();

          final post = allPosts[index - 1];
          return PostWidget(post: post);
        },
      ),
    );
  }

  Widget _buildStoryBar() {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allStory.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return _buildMyStoryAddButton();

          final story = allStory[index - 1];
          return _buildUserStory(story);
        },
      ),
    );
  }

  Column _buildUserStory(Story story) {
    return Column(
      children: [
        ProfileCircleWidget(radius: 100, user: story.addedBy),
        Text(story.addedBy.username),
      ],
    );
  }

  Column _buildMyStoryAddButton() {
    return Column(
      children: [
        AddStoryButton(radius: 100, user: myProfile),
        Text(
          'Your story',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildCustomAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InstagramLogo(),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.facebookMessenger,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
