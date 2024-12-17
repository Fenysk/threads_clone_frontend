import 'package:threads_clone/core/enums/role.enum.dart';
import 'package:threads_clone/features/user/2_domain/entity/profile.entity.dart';

class UserEntity {
  final String id;
  final String? email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Role> roles;
  final ProfileEntity? Profile;

  final UserCountEntity? count;

  UserEntity({
    required this.id,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
    required this.Profile,
    required this.count,
  });

  UserEntity copyWith({
    String? id,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Role>? roles,
    ProfileEntity? Profile,
    UserCountEntity? count,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      roles: roles ?? this.roles,
      Profile: Profile ?? this.Profile,
      count: count ?? this.count,
    );
  }
}

class UserCountEntity {
  final int Posts;
  final int Likes;
  final int Reposts;
  final int Mentions;
  final int Followers;
  final int Following;

  UserCountEntity({
    required this.Posts,
    required this.Likes,
    required this.Reposts,
    required this.Mentions,
    required this.Followers,
    required this.Following,
  });

  UserCountEntity copyWith({
    int? Posts,
    int? Likes,
    int? Reposts,
    int? Mentions,
    int? Followers,
    int? Following,
  }) {
    return UserCountEntity(
      Posts: Posts ?? this.Posts,
      Likes: Likes ?? this.Likes,
      Reposts: Reposts ?? this.Reposts,
      Mentions: Mentions ?? this.Mentions,
      Followers: Followers ?? this.Followers,
      Following: Following ?? this.Following,
    );
  }
}
