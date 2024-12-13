import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/core/constants/api_urls.dart';
import 'package:threads_clone/core/network/dio_client.dart';
import 'package:threads_clone/features/auth/1_data/source/auth-local.service.dart';
import 'package:threads_clone/features/create-post/1_data/dto/create-post.request.dart';
import 'package:threads_clone/service_locator.dart';

abstract class PostsApiService {
  Future<Either> likePost(String postId);
  Future<Either> unlikePost(String postId);
  Future<Either> createNewPost(CreatePostRequest newPost);
}

class PostsApiServiceImpl extends PostsApiService {
  @override
  Future<Either> likePost(String postId) async {
    try {
      String accessToken = await serviceLocator<AuthLocalService>().getAccessToken();

      final response = await serviceLocator<DioClient>().post(
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

  @override
  Future<Either> unlikePost(String postId) async {
    try {
      String accessToken = await serviceLocator<AuthLocalService>().getAccessToken();

      final response = await serviceLocator<DioClient>().delete(
        '${ApiUrls.unlikePost}/$postId',
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
  Future<Either> createNewPost(CreatePostRequest newPost) async {
    try {
      String accessToken = await serviceLocator<AuthLocalService>().getAccessToken();

      final response = await serviceLocator<DioClient>().post(
        '${ApiUrls.createNewPost}/',
        data: newPost.toMap(),
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
