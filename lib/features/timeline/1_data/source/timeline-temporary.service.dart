import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';

abstract class TimelineTemporaryService {
  List<PostEntity> get temporaryPosts;

  void addPostsInTimeline(List<PostEntity> newPosts);
  PostEntity? updatePostInTimeline(PostEntity updatedPost);
  PostEntity? getPostById(String postId);
}

class TimelineTemporaryServiceImpl extends TimelineTemporaryService {
  final List<PostEntity> _temporaryPostsTimeline = [];

  @override
  List<PostEntity> get temporaryPosts => _temporaryPostsTimeline;

  @override
  void addPostsInTimeline(List<PostEntity> newPosts) {
    final existingPostIds = _temporaryPostsTimeline.map((post) => post.id).toSet();

    for (var newPost in newPosts) {
      final isPostAlreadyExist = existingPostIds.contains(newPost.id);

      if (isPostAlreadyExist) {
        final postIndex = _temporaryPostsTimeline.indexWhere((post) => post.id == newPost.id);
        _temporaryPostsTimeline[postIndex] = newPost;
      } else {
        _temporaryPostsTimeline.add(newPost);
        existingPostIds.add(newPost.id);
      }
    }
  }

  @override
  PostEntity? updatePostInTimeline(PostEntity updatedPost) {
    final index = _temporaryPostsTimeline.indexWhere((post) => post.id == updatedPost.id);

    bool isPostExist = index != -1;

    if (isPostExist) {
      _temporaryPostsTimeline[index] = updatedPost;
      return updatedPost;
    }

    return null;
  }

  @override
  PostEntity? getPostById(String postId) {
    try {
      return _temporaryPostsTimeline.firstWhere((post) => post.id == postId);
    } catch (e) {
      return null;
    }
  }
}
