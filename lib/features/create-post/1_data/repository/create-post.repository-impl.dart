import 'package:threads_clone/features/create-post/1_data/source/create-post-local.service.dart';
import 'package:threads_clone/features/create-post/2_domain/enum/create-post-visibility.enum.dart';
import 'package:threads_clone/features/create-post/2_domain/repository/create-post.repository.dart';
import 'package:threads_clone/service_locator.dart';

class CreatePostRepositoryImpl extends CreatePostRepository {
  @override
  CreatePostVisibilityEnum changePostVisility(String visibility) {
    CreatePostVisibilityEnum visibilityEnum = serviceLocator<CreatePostLocalService>().changePostVisibility(visibility);

    return visibilityEnum;
  }
}
