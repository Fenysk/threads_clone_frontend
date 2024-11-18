import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/3_presentation/core/constants/api_urls.dart';
import 'package:threads_clone/3_presentation/core/network/dio_client.dart';
import 'package:threads_clone/service_locator.dart';

abstract class PostsApiService {
  Future<Either> likePost(String postId);
}

class PostsApiServiceImpl extends PostsApiService {
  @override
  Future<Either> likePost(String postId) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      final accessToken = sharedPreferences.getString('accessToken');

      final response = await serviceLocator<DioClient>().get(
        '${ApiUrls.likePost}/$postId',
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
