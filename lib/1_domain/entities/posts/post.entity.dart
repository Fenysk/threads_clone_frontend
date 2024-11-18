import 'package:threads_clone/1_domain/entities/user/user.entity.dart';

class PostEntity {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? editedAt;
  final String textContent;
  final List<String> mediaUrls;
  final int viewsCount;
  final String authorId;
  final String? replyToId;
  final String? quoteToId;

  final PostCountEntity count;

  final UserEntity Author;

  PostEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.editedAt,
    required this.textContent,
    required this.mediaUrls,
    required this.viewsCount,
    required this.authorId,
    required this.replyToId,
    required this.quoteToId,
    required this.count,
    required this.Author,
  });
}

class PostCountEntity {
  final int Likes;
  final int Reposts;
  final int Replies;
  final int Quotes;
  final int Hashtags;
  final int Mentions;

  PostCountEntity({
    required this.Likes,
    required this.Reposts,
    required this.Replies,
    required this.Quotes,
    required this.Hashtags,
    required this.Mentions,
  });
}
