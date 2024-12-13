import 'package:threads_clone/features/create-post/1_data/dto/create-post.request.dart';
import 'package:threads_clone/features/post/2_domain/enum/create-post-visibility.enum.dart';

abstract class CreatePostLocalService {
  CreatePostRequest? get newEditingPost;
  VisibilityEnum changePostVisibility(String visibility);
  void updateTextContent(String content);
  void addMediaUrl(String url);
  void removeMediaUrl(String url);
  void setReplyToId(String id);
  void setQuoteToId(String id);
  void reset();
}

class CreatePostLocalServiceImpl implements CreatePostLocalService {
  CreatePostRequest? _newEditingPost = CreatePostRequest(
    textContent: '',
    mediaUrls: [],
    visibility: VisibilityEnum.everyone,
  );

  @override
  CreatePostRequest? get newEditingPost => _newEditingPost;

  @override
  VisibilityEnum changePostVisibility(String visibility) {
    final visibilityEnum = VisibilityEnum.values.firstWhere((element) => element.name == visibility);

    _updatePost(visibilityEnum: visibilityEnum);

    return visibilityEnum;
  }

  @override
  void updateTextContent(String content) {
    _updatePost(textContent: content);
  }

  @override
  void addMediaUrl(String url) {
    final currentUrls = List<String>.from(_newEditingPost?.mediaUrls ?? []);
    currentUrls.add(url);
    _updatePost(mediaUrls: currentUrls);
  }

  @override
  void removeMediaUrl(String url) {
    final currentUrls = List<String>.from(_newEditingPost?.mediaUrls ?? []);
    currentUrls.remove(url);
    _updatePost(mediaUrls: currentUrls);
  }

  @override
  void setReplyToId(String id) {
    _updatePost(replyToId: id);
  }

  @override
  void setQuoteToId(String id) {
    _updatePost(quoteToId: id);
  }

  @override
  void reset() {
    _newEditingPost = CreatePostRequest(
      textContent: '',
      mediaUrls: [],
      visibility: VisibilityEnum.everyone,
    );
  }

  void _updatePost({
    String? textContent,
    List<String>? mediaUrls,
    String? replyToId,
    String? quoteToId,
    VisibilityEnum? visibilityEnum,
  }) {
    _newEditingPost = CreatePostRequest(
      textContent: textContent ?? _newEditingPost?.textContent ?? '',
      mediaUrls: mediaUrls ?? _newEditingPost?.mediaUrls ?? [],
      replyToId: replyToId ?? _newEditingPost?.replyToId,
      quoteToId: quoteToId ?? _newEditingPost?.quoteToId,
      visibility: visibilityEnum ?? _newEditingPost?.visibility ?? VisibilityEnum.everyone,
    );
  }
}
