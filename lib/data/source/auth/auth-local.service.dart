import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
}

class AuthLocalServiceImpl extends AuthLocalService {
  @override
  Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString('accessToken');

    print("accessToken: $accessToken");

    if (accessToken == null) return false;

    try {
      final isExpired = !JwtDecoder.isExpired(accessToken);

      return isExpired;
    } catch (e) {
      return false;
    }
  }
}
