import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/create-post/2_domain/enum/create-post-visibility.enum.dart';
import 'package:threads_clone/features/create-post/2_domain/repository/create-post.repository.dart';
import 'package:threads_clone/features/create-post/3_presentation/bloc/change_create_post_visibility/change_create_post_visibility_state.dart';
import 'package:threads_clone/service_locator.dart';

class ChangeCreatePostVisibilityCubit extends Cubit<ChangeCreatePostVisibilityState> {
  ChangeCreatePostVisibilityCubit() : super(const ChangeCreatePostVisibility('Tout le monde peut répondre et citer'));

  changeCreatePostVisibility(String visibility) async {
    CreatePostVisibilityEnum visibilityEnum = await serviceLocator<CreatePostRepository>().changePostVisility(visibility);

    return switch (visibilityEnum) {
      CreatePostVisibilityEnum.everyone => emit(ChangeCreatePostVisibility('Tout le monde peut répondre et citer')),
      CreatePostVisibilityEnum.followings => emit(ChangeCreatePostVisibility('Les profils que vous suivez peuvent répondre et citer')),
      CreatePostVisibilityEnum.mentioned => emit(ChangeCreatePostVisibility('Les profils que vous mentionnez peuvent répondre et citer')),
    };
  }
}
