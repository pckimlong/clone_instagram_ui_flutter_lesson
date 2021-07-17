import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helper/helper.dart' as helper;
import '../model/post_model.dart';
import '../model/user_model.dart';
import '../pages/profile_page.dart';
import 'circle_profile_widget.dart';
import 'like_button.dart';
import 'post_content_card.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 7, bottom: 5),
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          _buildPostTopBar(context),
          PostContent(post: post),
          _buildBottomBar(),
          SizedBox(height: 2),
          _buildLikeStatus(),
          SizedBox(height: 2),
          _buildCaption(context),
          post.commentsCount > 0 ? _buildViewAllComment() : SizedBox.shrink(),
          SizedBox(height: 2),
          _buildPostedDate()
        ],
      ),
    );
  }

  Align _buildPostedDate() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Text(
          '${post.timeAgo}',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Align _buildViewAllComment() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Text(
          'View all ${post.commentsCount} comments',
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }

  Padding _buildCaption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.postedBy.username,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          Text(
            post.caption,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildLikeStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Container(
            width: 64,
            child: Stack(
              children: [
                Positioned(
                  right: 1,
                  child: ProfileCircleWidget(
                      radius: 30, user: helper.getRandomUser),
                ),
                Positioned(
                    right: 21,
                    child: ProfileCircleWidget(
                        radius: 30, user: helper.getRandomUser)),
                Positioned(
                    child: ProfileCircleWidget(
                        radius: 30, user: helper.getRandomUser)),
              ],
            ),
          ),
          SizedBox(width: 5),
          Text('Liked by', style: TextStyle(fontSize: 16)),
          SizedBox(width: 5),
          Text(
            helper.getRandomUser.username,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(width: 5),
          Text('and', style: TextStyle(fontSize: 16)),
          SizedBox(width: 5),
          Text(
            '${post.likesCount - 1} others',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Container _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeartButton(),
              SizedBox(width: 15),
              _commentButton,
              SizedBox(width: 15),
              Icon(FontAwesomeIcons.paperPlane, size: 25),
            ],
          ),
          Icon(Icons.bookmark_outline, size: 30),
        ],
      ),
    );
  }

  Transform get _commentButton {
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: Icon(FontAwesomeIcons.comment, size: 26));
  }

  Widget _buildPostTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileCircleWidget(radius: 50, user: post.postedBy),
              SizedBox(width: 8),
              InkWell(
                onTap: () => _openProfileScreen(context, post.postedBy),
                child: Text(
                  post.postedBy.username,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
          ),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }

  void _openProfileScreen(BuildContext context, User user) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProfilePage(user: user)));
  }
}
