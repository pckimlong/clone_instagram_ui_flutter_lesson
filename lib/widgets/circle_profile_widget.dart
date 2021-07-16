import 'package:flutter/material.dart';

import '../model.dart';

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
          Center(
            child: Container(
              width: radius * 0.8,
              height: radius * 0.8,
              decoration: user.hasAddStory
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
          ),
          Center(
            child: CircleAvatar(
              radius: radius * 0.375,
              backgroundColor: Colors.white,
            ),
          ),
          Center(
              child: CircleAvatar(
            radius: radius * 0.34,
            backgroundImage: NetworkImage(user.profileUrl),
          )),
        ],
      ),
    );
  }
}
