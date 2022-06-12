import 'dart:async';
import 'dart:convert';

import 'package:classify/utils/auth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String? accessToken;
  String? refreshToken;
  String? role;
  SharedPreferences? prefs;
  var user;
  String base = 'http://localhost:8000';
  Auth() {
    init();
  }

  init() async {
    await getuserDataFromLocalStorage();
    print(accessToken);
    startRefreshingTheAccessToken();
    notifyListeners();
  }

  startRefreshingTheAccessToken() async {
    Timer.periodic(const Duration(seconds: 100), (t) async {
      print(t.tick);

      http.Response res =
          await http.get(Uri.parse(base + "/newaccesstoken"), headers: {
        "token": refreshToken!,
      });
      var data = jsonDecode(res.body);
      if (res.statusCode == 200) {
        accessToken = data['access_token'];
        refreshToken = data['refresh_token'];
        prefs!.setString("accessToken", accessToken!);
        prefs!.setString("refreshToken", refreshToken!);
        print("access token refreshed");
        notifyListeners();
      }
    });
  }

  getuserDataFromLocalStorage() async {
    prefs = await SharedPreferences.getInstance();
    accessToken = prefs!.getString('accessToken');
    refreshToken = prefs!.getString('refreshToken');
    role = prefs!.getString('role');
    await getuserDetails();
  }

  getuserDetails() async {
    http.Response res = await http.get(Uri.parse(base + "/userdetails"),
        headers: {'token': accessToken!});
    if (res.statusCode == 200 && role != null) {
      if (role == 'Institute') {
        user = Institute.fromJson(jsonDecode(res.body));
      } else if (role == "Teacher") {
        user = Teacher.fromJson(jsonDecode(res.body));
      } else if (role == "Parent") {
        user = Parent.fromJson(jsonDecode(res.body));
      } else if (role == "Student") {
        user = Student.fromJson(jsonDecode(res.body));
      }

      notifyListeners();
    } else if (res.statusCode == 400) {
      res = await http.get(Uri.parse(base + "/newaccesstoken"),
          headers: {'token': refreshToken!});
      var newtokens = jsonDecode(res.body);
      prefs!.setString("accessToken", newtokens["access_token"]);
      prefs!.setString("refreshToken", newtokens["refresh_token"]);
      await getuserDataFromLocalStorage();
      getuserDetails();
    }
  }

  logout() {
    accessToken = null;
    refreshToken = null;
    role = null;
    prefs = null;
    user = null;
  }
}
