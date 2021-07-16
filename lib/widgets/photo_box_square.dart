import 'package:flutter/material.dart';

class PhotoBoxSquare extends StatelessWidget {
  const PhotoBoxSquare({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final double size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
