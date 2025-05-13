import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:Mxels/models/user_info.dart';

class UserProvider with ChangeNotifier {
  UserInfo? _user;

  UserInfo? get user => _user;

  void setUser({
    required String name,
    required String birthday,
    required String phone,
    required String email,
    required String password,
  }) {
    _user = UserInfo(
      name: name,
      bday: birthday,
      phoneNumber: phone,
      email: email,
      password: password,
    );
    _saveUserToPrefs();
    notifyListeners();
  }

  void clearUser() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user_data');
    notifyListeners();
  }

  Future<void> loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user_data');
    if (userString != null) {
      final json = jsonDecode(userString);
      _user = UserInfo.fromJson(json);
      notifyListeners();
    }
  }

  Future<void> _saveUserToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (_user != null) {
      prefs.setString('user_data', jsonEncode(_user!.toJson()));
    }
  }
}
