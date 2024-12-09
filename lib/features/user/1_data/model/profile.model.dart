import 'dart:convert';
import 'package:threads_clone/features/user/2_domain/entity/profile.entity.dart';

class ProfileModel {
  final String userId;
  final String? pseudo;
  final String? displayName;
  final String? biography;
  final String? link;
  final String? avatarUrl;

  ProfileModel({
    required this.userId,
    required this.pseudo,
    required this.displayName,
    required this.biography,
    required this.link,
    required this.avatarUrl,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      userId: map['userId'] as String,
      pseudo: map['pseudo'] as String?,
      displayName: map['displayName'] as String?,
      biography: map['biography'] as String?,
      link: map['link'] as String?,
      avatarUrl: map['avatarUrl'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'pseudo': pseudo,
      'displayName': displayName,
      'biography': biography,
      'link': link,
      'avatarUrl': avatarUrl,
    };
  }

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

extension ProfileModelExtension on ProfileModel {
  ProfileEntity toEntity() => ProfileEntity(
        userId: userId,
        pseudo: pseudo,
        displayName: displayName,
        biography: biography,
        link: link,
        avatarUrl: avatarUrl,
      );
}
