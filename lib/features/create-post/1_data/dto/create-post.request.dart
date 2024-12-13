import 'package:threads_clone/features/create-post/2_domain/enum/create-post-visibility.enum.dart';

class CreatePostRequest {
  final String textContent;
  final List<String> mediaUrls;
  final String replyToId;
  final String quoteToId;
  final CreatePostVisibilityEnum visibilityEnum;

  CreatePostRequest({
    required this.textContent,
    required this.mediaUrls,
    required this.replyToId,
    required this.quoteToId,
    required this.visibilityEnum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'textContent': textContent,
      'mediaUrls': mediaUrls,
      'replyToId': replyToId,
      'quoteToId': quoteToId,
      'visibility': visibilityEnum.name,
    };
  }

  String? validate() {
    if (textContent.trim().isEmpty) {
      return 'Le contenu du post ne peut pas être vide';
    }

    if (textContent.length > 500) {
      return 'Le contenu du post ne peut pas dépasser 500 caractères';
    }

    if (mediaUrls.length > 4) {
      return 'Vous ne pouvez pas ajouter plus de 4 médias';
    }

    return null;
  }
}
