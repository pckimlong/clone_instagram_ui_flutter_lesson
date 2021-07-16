import 'package:clone_ig/model.dart';

final myProfile = User(
  username: 'long',
  profileUrl:
      'https://cn.i.cdn.ti-platform.com/cnapac/content/438/showpage/teen-titans-go%21/sa/showicon.png',
  hasAddStory: false,
  profileDescription: 'Hello',
  followers: 10,
  following: 50,
  postCount: 20,
);

final allUsers = [
  User(
    username: 'Dyna',
    profileUrl:
        'https://www.biography.com/.image/t_share/MTM2OTI2NTY2Mjg5NTE2MTI5/justin_bieber_2015_photo_courtesy_dfree_shutterstock_348418241_croppedjpg.jpg',
    hasAddStory: false,
    profileDescription: 'Hello',
    followers: 10,
    following: 50,
    postCount: 20,
  ),
  User(
    username: 'Ra',
    profileUrl:
        'https://www.planetsport.com/image-library/square/500/l/lionel-messi.jpg',
    hasAddStory: true,
    profileDescription: 'Hello',
    followers: 10,
    following: 50,
    postCount: 20,
  ),
  User(
    username: 'Mengly',
    profileUrl:
        'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
    hasAddStory: false,
    profileDescription: 'Hello',
    followers: 10,
    following: 50,
    postCount: 20,
  ),
];

final myStory = Story(
    user: myProfile,
    storyImageUrl:
        'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
    addedOn: '');

final allStory = [
  Story(
      user: allUsers[0],
      storyImageUrl:
          'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
      addedOn: ''),
  Story(
      user: allUsers[0],
      storyImageUrl:
          'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
      addedOn: ''),
  Story(
      user: allUsers[0],
      storyImageUrl:
          'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
      addedOn: ''),
  Story(
      user: allUsers[0],
      storyImageUrl:
          'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
      addedOn: ''),
];

final allPosts = [
  Post(
    user: myProfile,
    likesCount: 10,
    caption: 'Testing',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: [
      'https://i.guim.co.uk/img/media/c8b1d78883dfbe7cd3f112495941ebc0b25d2265/256_0_3840_2304/master/3840.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=579884b0bd058f1350519d3cc586d587',
      'https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png'
    ],
  ),
  Post(
    user: allUsers[0],
    likesCount: 10,
    caption: 'Testing',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: [
      'https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png'
    ],
  ),
  Post(
    user: allUsers[0],
    likesCount: 10,
    caption: 'Testing',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: [],
  ),
  Post(
    user: allUsers[0],
    likesCount: 10,
    caption: 'Testing',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: [],
  ),
  Post(
    user: allUsers[0],
    likesCount: 10,
    caption: 'Testing',
    commentsCount: 20,
    timeAgo: '30 minutes ago',
    imageUrls: [],
  ),
];
