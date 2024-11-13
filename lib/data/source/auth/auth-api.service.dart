import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/core/constants/api_urls.dart';
import 'package:threads_clone/core/network/dio_client.dart';
import 'package:threads_clone/data/dto/login.request.dart';
import 'package:threads_clone/data/dto/register.request.dart';
import 'package:threads_clone/service_locator.dart';

abstract class AuthApiService {
  Future<Either> register(RegisterRequest registerRequest);

  Future<Either> getMyProfile();

  Future<Either> login(LoginRequest loginRequest);

  Future<Either> logout();
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> register(RegisterRequest registerRequest) async {
    try {
      final response = await serviceLocator<DioClient>().post(
        ApiUrls.register,
        data: registerRequest.toMap(),
      );

      return Right(response);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getMyProfile() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final accessToken = sharedPreferences.getString('accessToken');

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
  Future<Either> login(LoginRequest loginRequest) async {
    try {
      final response = await serviceLocator<DioClient>().post(
        ApiUrls.login,
        data: loginRequest.toMap(),
      );

      return Right(response);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> logout() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final accessToken = sharedPreferences.getString('accessToken');

      final response = await serviceLocator<DioClient>().post(
        ApiUrls.logout,
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
}
