import 'package:clone_ig/model.dart';

final myProfile = User(
  username: 'long',
  name: 'Poch Kimlong',
  profileUrl:
      'https://scontent.fpnh6-1.fna.fbcdn.net/v/t1.6435-9/120562574_809761903188306_1310336796073283433_n.jpg?_nc_cat=101&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHHCbh-M3f28c4bhdx4KSpmFNWY_w_YewkU1Zj_D9h7CRnbo4VRGIhK6n7td_DCTLxjQaeDSwUrUOlNe6CWeV7x&_nc_ohc=Y03QlfeLGl8AX9BKQNp&_nc_ht=scontent.fpnh6-1.fna&oh=4b1a26847931fc2b37f159a2d591f92f&oe=60F60876',
  profileDescription:
      'Hello everybody lady and getlemen my name is Kimlong and I come from cambodia',
  followers: 10,
  following: 50,
  postCount: 20,
);

final allUsers = [
  User(
    username: 'Dyna',
    name: 'Dyna',
    profileUrl:
        'https://www.biography.com/.image/t_share/MTM2OTI2NTY2Mjg5NTE2MTI5/justin_bieber_2015_photo_courtesy_dfree_shutterstock_348418241_croppedjpg.jpg',
    profileDescription: 'Hello',
    followers: 10,
    following: 50,
    postCount: 20,
  ),
  User(
    username: 'Ra',
    name: 'Dyna',
    profileUrl:
        'https://www.planetsport.com/image-library/square/500/l/lionel-messi.jpg',
    profileDescription: 'Hello',
    followers: 10,
    following: 50,
    postCount: 20,
  ),
  User(
    username: 'Mengly',
    name: 'Dyna',
    profileUrl:
        'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
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
      user: allUsers[1],
      storyImageUrl:
          'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
      addedOn: ''),
  Story(
      user: allUsers[1],
      storyImageUrl:
          'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
      addedOn: ''),
  Story(
      user: allUsers[1],
      storyImageUrl:
          'https://www.biography.com/.image/t_share/MTc5OTQ5OTg4NjY5ODI2MTcw/gettyimages-971463110.jpg',
      addedOn: ''),
  Story(
      user: allUsers[1],
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
    imageUrls: [
      'https://cn.i.cdn.ti-platform.com/cnapac/content/2017/showpage/ben-10/sa/showicon.png'
    ],
  ),
];
