import 'package:flutter/material.dart';

import '../model/user_model.dart';

class AddStoryButton extends StatelessWidget {
  const AddStoryButton({
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
          _buildImage(),
          _buildAddIcon(),
        ],
      ),
    );
  }

  Stack _buildAddIcon() {
    return Stack(
      children: [
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 12,
          child: Icon(
            Icons.circle,
            color: Colors.blue,
          ),
        ),
        Positioned(
          bottom: 14,
          right: 14,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }

  Center _buildImage() {
    return Center(
        child: CircleAvatar(
      radius: radius * 0.35,
      backgroundImage: NetworkImage(user.profileUrl),
    ));
  }
}
