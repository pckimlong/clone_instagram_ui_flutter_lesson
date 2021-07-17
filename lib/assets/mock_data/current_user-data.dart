import 'story_data.dart';
import 'user_data.dart';

final myProfile = allUsers[0];
get myStory =>
    allStory.skipWhile((story) => story.addedBy == myProfile).toList().first;
