import 'package:clone_ig/assets/mock_data/user_data.dart';
import 'package:clone_ig/helper/helper.dart';
import 'package:clone_ig/model/post_model.dart';

import 'current_user-data.dart';

final allPosts = [
  Post(
    postedBy: myProfile,
    likesCount: 100,
    caption: 'Clone IG',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(count: 3),
  ),
  Post(
    postedBy: getRandomUser,
    likesCount: 5000,
    caption: 'Hello everyone',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(count: 2),
  ),
  Post(
    postedBy: getRandomUser,
    likesCount: 10,
    caption: 'Sleeping',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(),
  ),
  Post(
    postedBy: getRandomUser,
    likesCount: 12,
    caption: 'Sunday',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(),
  ),
  Post(
    postedBy: getRandomUser,
    likesCount: 8,
    caption: 'Weekend',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(count: 3),
  ),
  Post(
    postedBy: getRandomUser,
    likesCount: 1,
    caption: 'Weekend',
    commentsCount: 0,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(count: 3),
  ),
  Post(
    postedBy: getRandomUser,
    likesCount: 10,
    caption: 'Weekend',
    commentsCount: 0,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(count: 3),
  ),
  Post(
    postedBy: getRandomUser,
    likesCount: 587,
    caption: 'Weekend',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(count: 3),
  ),
  Post(
    postedBy: getRandomUser,
    likesCount: 10,
    caption: 'Weekend',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: getRandomImageUrl(count: 3),
  ),
];
