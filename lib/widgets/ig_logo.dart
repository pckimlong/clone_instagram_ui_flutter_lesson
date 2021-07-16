import 'package:flutter/material.dart';

class InstagramLogo extends StatelessWidget {
  const InstagramLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Instagram',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        fontFamily: 'igFont',
      ),
    );
  }
}
