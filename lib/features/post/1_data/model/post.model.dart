import 'dart:convert';
import 'package:threads_clone/features/user/1_data/model/user.model.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';

class PostModel {
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

  final PostCountModel count;

  final UserModel author;

  PostModel({
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
    required this.author,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      updatedAt: DateTime.parse(map['updatedAt'] as String),
      editedAt: map['editedAt'] != null ? DateTime.parse(map['editedAt'] as String) : null,
      textContent: map['textContent'] as String,
      mediaUrls: List<String>.from(map['mediaUrls'] ?? []),
      viewsCount: map['viewsCount'] as int,
      authorId: map['authorId'] as String,
      replyToId: map['replyToId'] as String?,
      quoteToId: map['quoteToId'] as String?,
      count: PostCountModel.fromMap(map['_count'] as Map<String, dynamic>),
      author: UserModel.fromMap(map['Author'] as Map<String, dynamic>),
    );
  }

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source));

  static List<PostModel> parsePostsFromResponse(dynamic data) {
    return (data as List).map((e) => PostModel.fromMap(e as Map<String, dynamic>)).toList();
  }

  static List<PostEntity> toListEntity(List<PostModel> postModels) {
    return postModels.map((postModel) => postModel.toEntity()).toList();
  }
}

extension PostModelExtension on PostModel {
  PostEntity toEntity() => PostEntity(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        editedAt: editedAt,
        textContent: textContent,
        mediaUrls: mediaUrls,
        viewsCount: viewsCount,
        authorId: authorId,
        replyToId: replyToId,
        quoteToId: quoteToId,
        count: count.toEntity(),
        Author: author.toEntity(),
      );
}

class PostCountModel {
  final int likes;
  final int reposts;
  final int replies;
  final int quotes;
  final int hashtags;
  final int mentions;

  PostCountModel({
    required this.likes,
    required this.reposts,
    required this.replies,
    required this.quotes,
    required this.hashtags,
    required this.mentions,
  });

  factory PostCountModel.fromMap(Map<String, dynamic> map) {
    return PostCountModel(
      likes: map['Likes'] as int,
      reposts: map['Reposts'] as int,
      replies: map['Replies'] as int,
      quotes: map['Quotes'] as int,
      hashtags: map['Hashtags'] as int,
      mentions: map['Mentions'] as int,
    );
  }
}

extension PostCountModelExtension on PostCountModel {
  PostCountEntity toEntity() => PostCountEntity(
        Likes: likes,
        Reposts: reposts,
        Replies: replies,
        Quotes: quotes,
        Hashtags: hashtags,
        Mentions: mentions,
      );
}
