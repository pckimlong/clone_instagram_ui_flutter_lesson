import 'package:clone_ig/assets/mock_data/story_data.dart';
import 'package:clone_ig/assets/mock_data/user_data.dart';

final myProfile = allUsers[0];
get myStory =>
    allStory.skipWhile((story) => story.addedBy == myProfile).toList().first;
