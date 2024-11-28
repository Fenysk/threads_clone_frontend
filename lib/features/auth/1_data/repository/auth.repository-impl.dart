import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/features/auth/1_data/dto/login.request.dart';
import 'package:threads_clone/features/auth/1_data/dto/register.request.dart';
import 'package:threads_clone/features/auth/1_data/source/auth-api.service.dart';
import 'package:threads_clone/features/auth/1_data/source/auth-local.service.dart';
import 'package:threads_clone/features/auth/2_domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> register(RegisterRequest registerRequest) async {
    Either result = await serviceLocator<AuthApiService>().register(registerRequest);

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

        final accessToken = response.data['tokens']['accessToken'];
        final user = response.data['user'];

        if (accessToken != null) sharedPreferences.setString('accessToken', accessToken);

        return Right(user);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return await serviceLocator<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> login(LoginRequest loginRequest) async {
    Either result = await serviceLocator<AuthApiService>().login(loginRequest);

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

        final accessToken = response.data['tokens']['accessToken'];
        final refreshToken = response.data['tokens']['refreshToken'];
        final user = response.data['user'];

        if (accessToken != null) sharedPreferences.setString('accessToken', accessToken);
        if (refreshToken != null) sharedPreferences.setString('refreshToken', refreshToken);

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
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

        sharedPreferences.clear();

        return Right(data);
      },
    );
  }

  @override
  Future<Either> refresh() async {
    final refreshToken = await serviceLocator<AuthLocalService>().getRefreshToken();

    Either result = await serviceLocator<AuthApiService>().refresh(refreshToken);

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;

        final accessToken = response.data['tokens']['accessToken'];
        final refreshToken = response.data['tokens']['refreshToken'];

        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

        if (accessToken != null) sharedPreferences.setString('accessToken', accessToken);
        if (refreshToken != null) sharedPreferences.setString('refreshToken', refreshToken);

        return Right(accessToken);
      },
    );
  }
}
