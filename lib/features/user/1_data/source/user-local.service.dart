import 'package:shared_preferences/shared_preferences.dart';
import 'package:threads_clone/features/user/1_data/model/user.model.dart';

abstract class UserLocalService {
  Future<UserModel> getCurrentUser();
  Future<void> setCurrentUser(UserModel newCurrentUser);
  Future<void> clearUser();
}

class UserLocalServiceImpl extends UserLocalService {
  @override
  Future<UserModel> getCurrentUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final currentUserJson = sharedPreferences.getString('currentUser');

    if (currentUserJson == null || currentUserJson.isEmpty) {
      throw Exception('currentUser is empty');
    }

    final currentUser = UserModel.fromJson(currentUserJson);

    return currentUser;
  }

  @override
  Future<void> setCurrentUser(UserModel newCurrentUser) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String newCurrentUserJson = newCurrentUser.toJson();

    sharedPreferences.setString('currentUser', newCurrentUserJson);
  }

  @override
  Future<void> clearUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('currentUser');
  }
}
