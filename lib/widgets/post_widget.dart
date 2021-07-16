import 'package:flutter/material.dart';

import 'package:clone_ig/mock_data.dart';

import '../model.dart';
import 'circle_profile_widget.dart';

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
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          _buildPostBar(),
          PostContent(post: post),
          _buildBottomBar(),
          _buildLikeStatus(),
          _buildCaption(),
          _buildViewAllComment(),
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
          '5 hours ago',
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Text(
          'View all 5 comments',
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
            'Long',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 5),
          Text('Good night', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Row _buildLikeStatus() {
    return Row(
      children: [
        Container(
          width: 65,
          child: Stack(
            children: [
              Positioned(
                right: -1,
                child: ProfileCircleWidget(radius: 37, user: myProfile),
              ),
              Positioned(
                  right: 12,
                  child: ProfileCircleWidget(radius: 37, user: myProfile)),
              Positioned(
                  child: ProfileCircleWidget(radius: 37, user: myProfile)),
            ],
          ),
        ),
        Text('Liked by', style: TextStyle(fontSize: 16)),
        SizedBox(width: 5),
        Text(
          'Long',
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

  Widget _buildPostBar() {
    return Container(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileCircleWidget(radius: 50, user: post.user),
              SizedBox(width: 8),
              Text(
                post.user.username,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          Icon(Icons.more_vert),
        ],
      ),
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
            onPageChanged: (index) {
              setState(() {
                imageIndex = index + 1;
              });
            },
            itemCount: widget.post.imageUrls.length,
            itemBuilder: (context, index) {
              final photo = widget.post.imageUrls[index];
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(photo),
                    fit: BoxFit.cover,
                  ),
                ),
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
