import 'package:threads_clone/core/enums/role.enum.dart';
import 'package:threads_clone/features/user/2_domain/entity/profile.entity.dart';

class UserEntity {
  final String id;
  final String? email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Role> roles;
  final ProfileEntity? Profile;

  UserEntity({
    required this.id,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.roles,
    required this.Profile,
  });
}
