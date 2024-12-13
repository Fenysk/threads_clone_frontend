import 'package:dartz/dartz.dart';

abstract class CreatePostRepository {
  changePostVisility(String visibility);
  Future<Either> createNewPost();
}
