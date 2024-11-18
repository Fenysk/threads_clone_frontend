import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either> likePost(String postId);
}
