import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String name;
  final String profileUrl;
  final String profileDescription;
  final int followers;
  final int following;
  final int postCount;
  User({
    required this.username,
    required this.name,
    required this.profileUrl,
    required this.profileDescription,
    required this.followers,
    required this.following,
    required this.postCount,
  });

  @override
  List<Object?> get props => [
        followers,
        following,
        username,
        postCount,
        name,
        profileUrl,
        profileDescription
      ];
}

class Story extends Equatable {
  final User user;
  final String storyImageUrl;
  final String addedOn;
  Story({
    required this.user,
    required this.storyImageUrl,
    required this.addedOn,
  });

  @override
  List<Object?> get props => [user, storyImageUrl, addedOn];
}

class Post extends Equatable {
  final User user;
  final int likesCount;
  final String caption;
  final int commentsCount;
  final String timeAgo;
  final List<String> imageUrls;

  Post({
    required this.user,
    required this.likesCount,
    required this.caption,
    required this.commentsCount,
    required this.timeAgo,
    required this.imageUrls,
  });

  @override
  List<Object?> get props => [
        user,
        likesCount,
        caption,
        commentsCount,
        timeAgo,
        imageUrls,
      ];
}
