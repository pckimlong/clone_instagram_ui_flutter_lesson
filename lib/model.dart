class User {
  final String username;
  final String profileUrl;
  final bool hasAddStory;
  final String profileDescription;
  final int followers;
  final int following;
  final int postCount;
  User({
    required this.username,
    required this.profileUrl,
    required this.hasAddStory,
    required this.profileDescription,
    required this.followers,
    required this.following,
    required this.postCount,
  });
}

class Story {
  final User user;
  final String storyImageUrl;
  final String addedOn;
  Story({
    required this.user,
    required this.storyImageUrl,
    required this.addedOn,
  });
}

class Post {
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
}
