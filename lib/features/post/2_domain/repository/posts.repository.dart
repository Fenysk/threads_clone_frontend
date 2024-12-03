import 'package:dartz/dartz.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';

abstract class PostsRepository {
  Future<Either> likePost(PostEntity post);
  Future<Either> unlikePost(PostEntity post);
}
