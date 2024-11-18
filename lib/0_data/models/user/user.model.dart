import 'dart:convert';
import 'package:threads_clone/3_presentation/core/enums/role.enum.dart';
import 'package:threads_clone/0_data/models/user/profile.model.dart';
import 'package:threads_clone/1_domain/entities/user/user.entity.dart';

class UserModel {
  final String id;
  final String? email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Role> roles;
  final ProfileModel? Profile;

  UserModel({
    required this.id,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
    required this.Profile,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String?,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      roles: List<Role>.from((map['roles'] as List).map((role) => Role.values.firstWhere((e) => e.toString().split('.').last.toLowerCase() == role))),
      Profile: ProfileModel.fromMap(map['Profile'] as Map<String, dynamic>),
    );
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}

extension UserModelExtension on UserModel {
  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        createdAt: createdAt,
        updatedAt: updatedAt,
        roles: roles,
        Profile: Profile?.toEntity(),
      );
}
