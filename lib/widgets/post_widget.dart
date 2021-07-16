import 'dart:math';

import 'package:clone_ig/pages/profile_page.dart';
import 'package:clone_ig/widgets/photo_box_square.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:clone_ig/mock_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model.dart';
import 'circle_profile_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  User get randomUser {
    final _random = new Random();
    return allUsers[_random.nextInt(allUsers.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 7, bottom: 5),
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          _buildPostBar(context),
          PostContent(post: post),
          _buildBottomBar(),
          const SizedBox(height: 2),
          _buildLikeStatus(),
          const SizedBox(height: 2),
          _buildCaption(),
          post.commentsCount > 0 ? _buildViewAllComment() : SizedBox.shrink(),
          const SizedBox(height: 2),
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

  Padding _buildCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            post.user.username,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          Text('Good night', style: TextStyle(fontSize: 16)),
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
            width: 66,
            child: Stack(
              children: [
                Positioned(
                  right: 1,
                  child: ProfileCircleWidget(radius: 34, user: randomUser),
                ),
                Positioned(
                    right: 19,
                    child: ProfileCircleWidget(radius: 34, user: randomUser)),
                Positioned(
                    child: ProfileCircleWidget(radius: 34, user: randomUser)),
              ],
            ),
          ),
          SizedBox(width: 5),
          Text('Liked by', style: TextStyle(fontSize: 16)),
          SizedBox(width: 5),
          Text(
            randomUser.username,
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeartButton(),
              SizedBox(width: 15),
              Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Icon(FontAwesomeIcons.comment, size: 26)),
              SizedBox(width: 15),
              Icon(FontAwesomeIcons.paperPlane, size: 25),
            ],
          ),
          Icon(
            Icons.bookmark_outline,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget _buildPostBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileCircleWidget(radius: 50, user: post.user),
              SizedBox(width: 8),
              InkWell(
                onTap: () => _openProfileScreen(context, post.user),
                child: Text(
                  post.user.username,
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

class HeartButton extends StatefulWidget {
  const HeartButton({
    Key? key,
  }) : super(key: key);

  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: isLiked
          ? Icon(FontAwesomeIcons.solidHeart, size: 26, color: Colors.red)
          : Icon(FontAwesomeIcons.heart, size: 26),
    );
  }
}

class PostContent extends StatefulWidget {
  const PostContent({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  _PostContentState createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  var totalImage = 0;
  var imageIndex = 1;

  @override
  void initState() {
    super.initState();
    totalImage = widget.post.imageUrls.length;
    imageIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.post.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                imageIndex = index + 1;
              });
            },
            itemBuilder: (context, index) {
              final photo = widget.post.imageUrls[index];
              return PhotoBoxSquare(
                size: MediaQuery.of(context).size.width,
                imageUrl: photo,
              );
            },
          ),
          widget.post.imageUrls.isNotEmpty && widget.post.imageUrls.length != 1
              ? _buildImageCount()
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Container _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_outline, size: 30),
                  SizedBox(width: 10),
                  Icon(Icons.chat_outlined, size: 30),
                  SizedBox(width: 10),
                  Icon(Icons.share, size: 30),
                ],
              ),
              Icon(
                Icons.bookmark_outline,
                size: 30,
              ),
            ],
          ),
          Center(child: Icon(Icons.more_horiz))
        ],
      ),
    );
  }

  Positioned _buildImageCount() {
    return Positioned(
      right: 12,
      top: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          '$imageIndex/$totalImage',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
