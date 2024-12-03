import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either> likePost(String postId);
  Future<Either> unlikePost(String postId);
}
