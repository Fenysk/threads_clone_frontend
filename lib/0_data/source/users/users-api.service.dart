import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/0_data/source/auth/auth-local.service.dart';
import 'package:threads_clone/3_presentation/core/constants/api_urls.dart';
import 'package:threads_clone/3_presentation/core/network/dio_client.dart';
import 'package:threads_clone/0_data/dto/login.request.dart';
import 'package:threads_clone/0_data/dto/register.request.dart';
import 'package:threads_clone/service_locator.dart';

abstract class UsersApiService {
  Future<Either> getMyProfile();

  Future<Either> checkIfPseudoExist(String pseudo);
}

class UsersApiServiceImpl extends UsersApiService {
  @override
  Future<Either> getMyProfile() async {
    try {
      final accessToken = await serviceLocator<AuthLocalService>().getAccessToken();

      final response = await serviceLocator<DioClient>().get(
        ApiUrls.getMyProfile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      return Right(response);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> checkIfPseudoExist(String pseudo) async {
    try {
      final response = await serviceLocator<DioClient>().get(
        ApiUrls.checkIfPseudoExist,
        queryParameters: {
          'pseudo': pseudo,
        },
      );

      return Right(response);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }
}
