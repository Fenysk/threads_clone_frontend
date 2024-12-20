import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/core/constants/api_urls.dart';
import 'package:threads_clone/core/network/dio_client.dart';
import 'package:threads_clone/features/timeline/1_data/dto/pagination.request.dart';
import 'package:threads_clone/service_locator.dart';

abstract class TimelineApiService {
  Future<Either> getForYouTimeline(PaginationRequest? paginationRequest);
}

class TimelineApiServiceImpl extends TimelineApiService {
  @override
  Future<Either> getForYouTimeline(PaginationRequest? paginationRequest) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      final accessToken = sharedPreferences.getString('accessToken');

      final response = await serviceLocator<DioClient>().get(
        ApiUrls.getForYouTimeline,
        queryParameters: paginationRequest?.toMap(),
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
