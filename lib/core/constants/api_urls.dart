import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrls {
  static String get baseUrl =>
      dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000';

  static String get register => '$baseUrl/auth/register';
  static String get login => '$baseUrl/auth/login';
  static String get logout => '$baseUrl/auth/logout';
  static String get getMyProfile => '$baseUrl/users/my-profile';
}
