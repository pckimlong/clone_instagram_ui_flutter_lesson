import 'package:clone_ig/model/user_model.dart';
import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final User postedBy;
  final int likesCount;
  final String caption;
  final int commentsCount;
  final String timeAgo;
  final List<String> imageUrls;

  Post({
    required this.postedBy,
    required this.likesCount,
    required this.caption,
    required this.commentsCount,
    required this.timeAgo,
    required this.imageUrls,
  });

  @override
  List<Object?> get props => [
        postedBy,
        likesCount,
        caption,
        commentsCount,
        timeAgo,
        imageUrls,
      ];
}
