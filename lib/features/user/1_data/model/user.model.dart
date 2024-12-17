import 'dart:convert';
import 'package:threads_clone/core/enums/role.enum.dart';
import 'package:threads_clone/features/user/1_data/model/profile.model.dart';
import 'package:threads_clone/features/user/2_domain/entity/user.entity.dart';

class UserModel {
  final String id;
  final String? email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Role> roles;
  final ProfileModel? Profile;

  final UserCountModel? count;

  UserModel({
    required this.id,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
    required this.Profile,
    required this.count,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String?,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      roles: List<Role>.from((map['roles'] as List).map((role) => Role.values.firstWhere((e) => e.toString().split('.').last.toLowerCase() == role))),
      Profile: ProfileModel.fromMap(map['Profile'] as Map<String, dynamic>),
      count: map['_count'] != null ? UserCountModel.fromMap(map['_count'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'roles': roles.map((role) => role.toString().split('.').last.toLowerCase()).toList(),
      'Profile': Profile?.toMap(),
    };
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

extension UserModelExtension on UserModel {
  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        createdAt: createdAt,
        updatedAt: updatedAt,
        roles: roles,
        Profile: Profile?.toEntity(),
        count: count?.toEntity(),
      );
}

class UserCountModel {
  final int posts;
  final int likes;
  final int reposts;
  final int mentions;
  final int followers;
  final int following;

  UserCountModel({
    required this.posts,
    required this.likes,
    required this.reposts,
    required this.mentions,
    required this.followers,
    required this.following,
  });

  factory UserCountModel.fromMap(Map<String, dynamic> map) {
    return UserCountModel(
      posts: map['Posts'] as int,
      likes: map['Likes'] as int,
      reposts: map['Reposts'] as int,
      mentions: map['Mentions'] as int,
      followers: map['Followers'] as int,
      following: map['Following'] as int,
    );
  }
}

extension UserCountModelExtension on UserCountModel {
  UserCountEntity toEntity() => UserCountEntity(
        Posts: posts,
        Likes: likes,
        Reposts: reposts,
        Mentions: mentions,
        Followers: followers,
        Following: following,
      );
}
