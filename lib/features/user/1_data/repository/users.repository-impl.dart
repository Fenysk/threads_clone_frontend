import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/features/user/1_data/model/user.model.dart';
import 'package:threads_clone/features/user/1_data/source/user-local.service.dart';
import 'package:threads_clone/features/user/1_data/source/users-api.service.dart';
import 'package:threads_clone/features/user/2_domain/entity/user.entity.dart';
import 'package:threads_clone/features/user/2_domain/repository/users.repository.dart';
import 'package:threads_clone/service_locator.dart';

class UsersRepositoryImpl extends UsersRepository {
  @override
  Future<Either> getMyProfile() async {
    Either result = await serviceLocator<UsersApiService>().getMyProfile();

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;

        UserModel userModel = UserModel.fromMap(response.data);
        UserEntity user = userModel.toEntity();

        return Right(user);
      },
    );
  }

  @override
  Future<Either> getUserProfile(String userId) async {
    Either result = await serviceLocator<UsersApiService>().getUserProfile(userId);

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;

        UserModel userModel = UserModel.fromMap(response.data);
        UserEntity user = userModel.toEntity();

        return Right(user);
      },
    );
  }

  @override
  Future<Either> loadMyUserProfile() async {
    try {
      UserModel currentUserLoaded = await serviceLocator<UserLocalService>().getCurrentUser();
      UserEntity userEntity = currentUserLoaded.toEntity();

      return Right(userEntity);
    } catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either> checkIfPseudoExist(String pseudo) async {
    Either result = await serviceLocator<UsersApiService>().checkIfPseudoExist(pseudo);

    return result.fold(
      (error) => Left(error),
      (data) => Right(data),
    );
  }
}
