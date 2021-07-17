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
