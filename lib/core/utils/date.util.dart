class DateUtil {
  static String getDisplayDateAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 10) {
      return 'Maintenant';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} s';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} j';
    } else if (difference.inDays < 365) {
      return '${difference.inDays ~/ 30} mo';
    } else {
      return '${difference.inDays ~/ 365} a';
    }
  }
}
