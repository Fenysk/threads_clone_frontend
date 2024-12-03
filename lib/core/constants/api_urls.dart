import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static String get baseUrl => dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000';

  // Auth
  static String get register => '$baseUrl/auth/register';
  static String get login => '$baseUrl/auth/login';
  static String get logout => '$baseUrl/auth/logout';
  static String get refresh => '$baseUrl/auth/refresh';

  // Users
  static String get getMyProfile => '$baseUrl/users/my-profile';
  static String get checkIfPseudoExist => '$baseUrl/users/check-pseudo';

  // Timeline
  static String get getForYouTimeline => '$baseUrl/timeline/for-you';

  // Posts
  static String get likePost => '$baseUrl/likes/like';
  static String get unlikePost => '$baseUrl/likes/unlike';
}
