import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageIcon extends StatelessWidget {
  const MessageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 8,
          ),
        ),
        Icon(
          FontAwesomeIcons.facebookMessenger,
          size: 26,
        ),
        Positioned(
          top: 2.8,
          left: 2.4,
          child: Icon(
            FontAwesomeIcons.facebookMessenger,
            size: 21,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
