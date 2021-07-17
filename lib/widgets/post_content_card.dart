import 'package:clone_ig/model/post_model.dart';
import 'package:flutter/material.dart';

import 'photo_box_square.dart';

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
