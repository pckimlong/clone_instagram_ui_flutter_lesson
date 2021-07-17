import 'package:clone_ig/assets/mock_data/story_data.dart';
import 'package:clone_ig/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:clone_ig/helper/helper.dart' as helper;

class ProfileCircleWidget extends StatelessWidget {
  const ProfileCircleWidget({
    Key? key,
    required this.user,
    required this.radius,
  }) : super(key: key);

  final User user;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius - 6,
      height: radius - 10,
      child: Stack(
        children: [
          _buildOuterLayer(),
          _buildWhiteCircleRing(),
          _buildImage(),
        ],
      ),
    );
  }

  Center _buildImage() {
    return Center(
        child: CircleAvatar(
      radius: radius * 0.35,
      backgroundImage: NetworkImage(user.profileUrl),
    ));
  }

  Center _buildWhiteCircleRing() {
    return Center(
      child: CircleAvatar(
        radius: radius * 0.375,
        backgroundColor: Colors.white,
      ),
    );
  }

  Center _buildOuterLayer() {
    return Center(
      child: Container(
        width: radius * 0.8,
        height: radius * 0.8,
        decoration: helper.checkIfUserHasStory(user)
            ? BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.purple,
                    Colors.red,
                  ],
                ),
              )
            : BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
      ),
    );
  }
}
