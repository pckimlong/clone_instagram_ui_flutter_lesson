import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
