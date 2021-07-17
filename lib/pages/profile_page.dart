import 'package:flutter/material.dart';

import '../assets/mock_data/user_data.dart';
import '../helper/helper.dart' as helper;
import '../model/user_model.dart';
import '../widgets/bottom_appbar.dart';
import '../widgets/circle_profile_widget.dart';
import '../widgets/photo_box_square.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  final bool openAsTab;
  const ProfilePage({
    Key? key,
    this.openAsTab = false,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: !openAsTab ? MyBottomAppBar() : null,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView(
                children: [
                  _buildProfileBar(),
                  _buildDescription(
                    children: [
                      _buildProfileName(),
                      const SizedBox(height: 1),
                      _buildProfileDescription(),
                      const SizedBox(height: 1),
                      _buildFollowerStatus(),
                      _buildActionButton(context),
                      helper.getStoryOfAnUser(user).length > 0
                          ? _buildStoryBar()
                          : SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _buildPostContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildPostContent() {
    return Column(
      children: [
        _buildPostTabBar(),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: helper.getPostOfAnUser(user).length,
          itemBuilder: (context, index) {
            final postData = helper.getPostOfAnUser(user)[index];
            return PhotoBoxSquare(
              size: MediaQuery.of(context).size.width / 3,
              imageUrl: postData.imageUrls[0],
            );
          },
        ),
      ],
    );
  }

  Container _buildPostTabBar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Center(child: Icon(Icons.grid_on)),
          ),
          SizedBox(width: 10),
          Container(
            child: Center(child: Icon(Icons.person)),
          ),
        ],
      ),
    );
  }

  SizedBox _buildStoryBar() {
    final stories = helper.getStoryOfAnUser(user);
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final userData = stories[index].addedBy;
          return ProfileCircleWidget(
            user: userData,
            radius: 100,
          );
        },
      ),
    );
  }

  Padding _buildActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Following',
                          style: Theme.of(context).textTheme.button,
                        ),
                        Icon(Icons.expand_more, color: Colors.black),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Following',
                          style: Theme.of(context).textTheme.button,
                        ),
                        Icon(Icons.expand_more, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Icon(Icons.expand_more, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Row _buildFollowerStatus() {
    return Row(
      children: [
        Text('Followed by', style: TextStyle(fontSize: 16)),
        SizedBox(width: 5),
        Text(
          helper.getRandomUser.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5),
        Text('and', style: TextStyle(fontSize: 16)),
        SizedBox(width: 5),
        Text(
          '${allUsers.length - 1} others',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Align _buildProfileDescription() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        user.profileDescription,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Align _buildProfileName() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        user.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Padding _buildDescription({required List<Widget> children}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: children,
      ),
    );
  }

  Row _buildProfileBar() {
    return Row(
      children: [
        ProfileCircleWidget(user: user, radius: 150),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 210,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCountNumber(count: user.postCount, label: 'Posts'),
                    _buildCountNumber(
                        count: user.followers, label: 'Followers'),
                    _buildCountNumber(
                        count: user.following, label: 'Following'),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Column _buildCountNumber({required int count, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$count',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          '$label',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Row _buildAppBar(BuildContext context) {
    final iconSize = 28.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            !openAsTab
                ? IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, size: iconSize),
                  )
                : SizedBox.shrink(),
            SizedBox(width: 12),
            Text(
              user.username,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined, size: iconSize),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, size: iconSize),
            ),
            SizedBox(width: 5),
          ],
        )
      ],
    );
  }
}
