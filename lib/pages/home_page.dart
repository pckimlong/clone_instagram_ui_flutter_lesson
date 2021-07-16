import 'package:flutter/material.dart';

import '../mock_data.dart';
import '../widgets/bottom_appbar.dart';
import '../widgets/circle_profile_widget.dart';
import '../widgets/custom_icons/message_icon.dart';
import '../widgets/ig_logo.dart';
import '../widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: allPosts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildStoryBar();
                  }
                  final post = allPosts[index - 1];
                  return PostWidget(post: post);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryBar() {
    return Container(
      height: 115,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.5)),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allStory.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                ProfileCircleWidget(radius: 100, user: myProfile),
                Text(
                  'Your story',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            );
          }
          final story = allStory[index - 1];
          return Column(
            children: [
              ProfileCircleWidget(radius: 100, user: story.user),
              Text(story.user.username),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: InstagramLogo(),
          ),
          IconButton(onPressed: () {}, icon: MessageIcon())
        ],
      ),
    );
  }
}
