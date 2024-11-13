import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/data/dto/login.request.dart';
import 'package:threads_clone/data/dto/register.request.dart';
import 'package:threads_clone/data/models/user.model.dart';
import 'package:threads_clone/data/source/auth/auth-api.service.dart';
import 'package:threads_clone/data/source/auth/auth-local.service.dart';
import 'package:threads_clone/domain/entities/user.entity.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> register(RegisterRequest registerRequest) async {
    Either result =
        await serviceLocator<AuthApiService>().register(registerRequest);

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        final accessToken = response.data['tokens']['accessToken'];
        final user = response.data['user'];

        if (accessToken != null)
          sharedPreferences.setString('accessToken', accessToken);

        return Right(user);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return await serviceLocator<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> getMyProfile() async {
    Either result = await serviceLocator<AuthApiService>().getMyProfile();

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;

        print('response: $response');
        print('response.data: ${response.data}');

        UserModel userModel = UserModel.fromMap(response.data);
        UserEntity user = userModel.toEntity();

        return Right(user);
      },
    );
  }

  @override
  Future<Either> login(LoginRequest loginRequest) async {
    Either result = await serviceLocator<AuthApiService>().login(loginRequest);

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        final accessToken = response.data['tokens']['accessToken'];
        final user = response.data['user'];

        if (accessToken != null)
          sharedPreferences.setString('accessToken', accessToken);

        return Right(user);
      },
    );
  }

  @override
  Future<Either> logout() async {
    Either result = await serviceLocator<AuthApiService>().logout();

    return result.fold(
      (error) => Left(error),
      (data) async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.clear();

        return Right(data);
      },
    );
  }
}
