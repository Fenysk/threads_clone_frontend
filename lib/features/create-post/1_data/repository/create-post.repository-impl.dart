import 'package:threads_clone/features/create-post/2_domain/enum/create-post-visibility.enum.dart';
import 'package:threads_clone/features/create-post/2_domain/repository/create-post.repository.dart';

class CreatePostRepositoryImpl extends CreatePostRepository {
  @override
  CreatePostVisibilityEnum changePostVisility(String visibility) {
    final visibilityEnum = CreatePostVisibilityEnum.values.firstWhere((element) => element.name == visibility);

    return visibilityEnum;
  }
}
