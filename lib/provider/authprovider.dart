import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String? accessToken;
  String? refreshToken;
  Auth() {
    init();
  }
  init() async {
    final prefs = await SharedPreferences.getInstance();
    accessToken = prefs.getString('accessToken');
    refreshToken = prefs.getString('refreshToken');
    notifyListeners();
  }
}
