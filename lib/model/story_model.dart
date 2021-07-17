import 'package:clone_ig/model/user_model.dart';
import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final User addedBy;
  final String storyImageUrl;
  final String addedOn;
  Story({
    required this.addedBy,
    required this.storyImageUrl,
    required this.addedOn,
  });

  @override
  List<Object?> get props => [addedBy, storyImageUrl, addedOn];
}
