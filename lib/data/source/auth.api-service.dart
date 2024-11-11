import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/core/constants/api_urls.dart';
import 'package:threads_clone/core/network/dio_client.dart';
import 'package:threads_clone/data/models/register.request.dart';
import 'package:threads_clone/service_locator.dart';

abstract class AuthApiService {
  Future<Either> register(RegisterRequest registerRequest);

  Future<Either> login();
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> register(RegisterRequest registerRequest) async {
    try {
      var response = await serviceLocator<DioClient>().post(
        ApiUrls.register,
        data: registerRequest.toMap(),
      );

      return Right(response);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
}
