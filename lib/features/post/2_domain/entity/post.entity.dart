import 'package:threads_clone/features/user/2_domain/entity/user.entity.dart';

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
  final PostEnrichedEntity enriched;

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
    required this.enriched,
    required this.Author,
  });

  PostEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? editedAt,
    String? textContent,
    List<String>? mediaUrls,
    int? viewsCount,
    String? authorId,
    String? replyToId,
    String? quoteToId,
    PostCountEntity? count,
    PostEnrichedEntity? enriched,
    UserEntity? Author,
  }) {
    return PostEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      editedAt: editedAt ?? this.editedAt,
      textContent: textContent ?? this.textContent,
      mediaUrls: mediaUrls ?? this.mediaUrls,
      viewsCount: viewsCount ?? this.viewsCount,
      authorId: authorId ?? this.authorId,
      replyToId: replyToId ?? this.replyToId,
      quoteToId: quoteToId ?? this.quoteToId,
      count: count ?? this.count,
      enriched: enriched ?? this.enriched,
      Author: Author ?? this.Author,
    );
  }
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

  PostCountEntity copyWith({
    int? Likes,
    int? Reposts,
    int? Replies,
    int? Quotes,
    int? Hashtags,
    int? Mentions,
  }) {
    return PostCountEntity(
      Likes: Likes ?? this.Likes,
      Reposts: Reposts ?? this.Reposts,
      Replies: Replies ?? this.Replies,
      Quotes: Quotes ?? this.Quotes,
      Hashtags: Hashtags ?? this.Hashtags,
      Mentions: Mentions ?? this.Mentions,
    );
  }
}

class PostEnrichedEntity {
  final bool isLiked;
  final bool isReposted;
  final bool isReplied;

  PostEnrichedEntity({
    required this.isLiked,
    required this.isReposted,
    required this.isReplied,
  });

  PostEnrichedEntity copyWith({
    bool? isLiked,
    bool? isReposted,
    bool? isReplied,
  }) {
    return PostEnrichedEntity(
      isLiked: isLiked ?? this.isLiked,
      isReposted: isLiked ?? this.isReposted,
      isReplied: isLiked ?? this.isReplied,
    );
  }
}
