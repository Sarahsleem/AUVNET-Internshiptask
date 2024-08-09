import 'package:hive/hive.dart';

import '../../../domain/entities/users.dart';


class LocalDataSource {
  Future<void> saveUser(User user) async {
    final box = await Hive.openBox('userBox');
    await box.put('user', user.toJson());
  }

  Future<User?> getUser() async {
    final box = await Hive.openBox('userBox');
    final userJson = box.get('user');
    if (userJson != null) {
      return User.fromJson(userJson);
    }
    return null;
  }

  Future<void> clearUserData() async {
    final box = await Hive.openBox('userBox');
    await box.clear();
  }
}