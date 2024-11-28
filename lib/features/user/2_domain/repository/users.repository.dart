import 'package:dartz/dartz.dart';

abstract class UsersRepository {
  Future<Either> getMyProfile();

  Future<Either> checkIfPseudoExist(String pseudo);
}
