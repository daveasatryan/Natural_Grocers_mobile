import 'dart:convert';

import 'package:natural_groceries/core/data/models/user/user_model.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  PreferencesManager._();

  static late SharedPreferences _pref;

  static Future<void> initPreferences() async {
    _pref = await SharedPreferences.getInstance();
  }

  /// keys
  static const _token = 'token';
  static const _user = 'user';
  static const _isFirstOne = 'first_one';

  static bool get isFirstOne => _pref.getBool(_isFirstOne) ?? false;

  static void setFirstOneValue(bool value) async {
    _pref.setBool(_isFirstOne, value);
  }

  static String? get token => _pref.getString(_token);

  static void setToken(String? value) async {
    if (value == null) {
      _pref.remove(_token);
      return;
    }
    _pref.setString(_token, value);
  }

  static String? get userUuid => _pref.getString(_token);

  static void setUserData(UserModel? user) {
    user?.token?.let((token) {
      setToken(token);
    });
    setUser(user);
  }

  static void clearUserData() {
    setToken(null);
    setUserData(null);
  }

  static UserModel? get user {
    String? user = _pref.getString(_user);

    if (user != null) {
      return UserModel.fromJson(jsonDecode(user));
    } else {
      return null;
    }
  }

  static void setUser(UserModel? user) {
    if (user == null) {
      _pref.remove(_user);
      return;
    }
    _pref.setString(_user, jsonEncode(user));
  }
}
