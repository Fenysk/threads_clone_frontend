import 'dart:convert';
import 'package:threads_clone/domain/entities/profile.entity.dart';

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

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));
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
