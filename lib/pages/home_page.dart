import 'package:clone_ig/mock_data.dart';
import 'package:clone_ig/widgets/circle_profile_widget.dart';
import 'package:clone_ig/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_outlined),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_box_outlined),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
              iconSize: 35,
            ),
            ProfileCircleWidget(user: myProfile, radius: 48),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: ListView.builder(
                itemCount: allPosts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildStoryBar();
                  }
                  return PostWidget(post: allPosts[index - 1]);
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
      height: 120,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allStory.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                ProfileCircleWidget(radius: 100, user: myProfile),
                Text('Your story'),
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
        children: [
          Text(
            'Instagram',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
            ),
          )
        ],
      ),
    );
  }
}
