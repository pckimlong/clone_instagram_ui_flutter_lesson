import 'dart:math';

import '../assets/mock_data/random_image.dart';
import '../assets/mock_data/user_data.dart';
import '../model/post_model.dart';
import '../model/story_model.dart';
import '../model/user_model.dart';

import '../assets/mock_data/post_data.dart';
import '../assets/mock_data/story_data.dart';

getPostOfAnUser(User user) =>
    allPosts.where((post) => post.postedBy == user).toList();

List<Story> getStoryOfAnUser(User user) =>
    allStory.where((story) => story.addedBy == user).toList();

User get getRandomUser {
  final _random = Random();
  return allUsers[_random.nextInt(allUsers.length)];
}

bool checkIfUserHasStory(User user) =>
    allStory.where((story) => story.addedBy == user).toList().isNotEmpty;

List<String> getRandomImageUrl({int count = 1}) {
  final _random = Random();
  final List<String> img = [];
  for (int i = 1; i <= count; i++) {
    img.add(images[_random.nextInt(images.length)]);
  }
  return img;
}

int get getRandomNumber {
  final _random = Random();
  return _random.nextInt(100000);
}
