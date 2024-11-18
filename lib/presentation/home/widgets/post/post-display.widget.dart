import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/core/utils/date.util.dart';
import 'package:threads_clone/domain/entities/posts/post.entity.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class PostDisplayWidget extends StatelessWidget {
  final PostEntity post;

  const PostDisplayWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(post.Author.Profile?.avatarUrl ?? ''),
                onForegroundImageError: (exception, stackTrace) => print('Error loading avatar: $exception'),
                backgroundColor: Colors.grey,
                child: post.Author.Profile?.avatarUrl == null
                    ? Text(
                        post.Author.Profile?.pseudo?.toUpperCase().substring(0, 2) ?? '',
                        style: const TextStyle(color: Colors.black),
                      )
                    : null,
              ),
              // TODO: add line to link with answer
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.Author.Profile?.pseudo ?? 'Unknown Author',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          DateUtil.getDisplayDateAgo(post.createdAt),
                          style: const TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const Icon(
                      FluentIcons.more_horizontal_20_regular,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                getRichTextContent(
                  onHashtagTap: (hashtag) => print('Hashtag tapped: $hashtag'),
                  onMentionTap: (mention) => print('Mention tapped: $mention'),
                ),
                getMediaContent(),
                const SizedBox(height: 16),
                getFooterContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getFooterContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(FluentIcons.heart_20_regular),
            if (post.count.Likes > 0) const SizedBox(width: 4),
            if (post.count.Likes > 0) Text('${post.count.Likes}', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(width: 32),
        Row(
          children: [
            const Icon(FluentIcons.comment_20_regular),
            if (post.count.Replies > 0) const SizedBox(width: 4),
            if (post.count.Replies > 0) Text('${post.count.Replies}', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(width: 32),
        Row(
          children: [
            const Icon(FluentIcons.arrow_repeat_all_20_regular),
            if (post.count.Reposts > 0) const SizedBox(width: 4),
            if (post.count.Reposts > 0) Text('${post.count.Reposts}', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(width: 32),
        const Row(
          children: [
            Icon(FluentIcons.share_ios_20_regular),
          ],
        ),
      ],
    );
  }

  Widget getMediaContent() {
    if (post.mediaUrls.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('Media content'),
    );
  }

  Text getRichTextContent({
    required Function(String) onHashtagTap,
    required Function(String) onMentionTap,
  }) {
    final List<TextSpan> textSpans = [];
    final List<String> words = post.textContent.split(' ');

    for (var word in words) {
      final firstCharacter = word[0];

      switch (firstCharacter) {
        case '#':
          textSpans.add(
            TextSpan(
              text: ' $word',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onHashtagTap(word);
                },
            ),
          );
          break;
        case '@':
          textSpans.add(
            TextSpan(
              text: ' $word',
              style: const TextStyle(color: Colors.green),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  onMentionTap(word);
                },
            ),
          );
          break;
        default:
          textSpans.add(TextSpan(text: ' $word', style: const TextStyle(fontSize: 16)));
      }
    }

    return Text.rich(
      TextSpan(children: textSpans),
      overflow: TextOverflow.ellipsis,
    );
  }
}
