import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Future<Either> getMyProfile();

  Future<Either> loadMyUserProfile();

  Future<Either> checkIfPseudoExist(String pseudo);
}
