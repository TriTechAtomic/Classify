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
    getuserDataFromLocalStorage();
    notifyListeners();
  }

  getuserDataFromLocalStorage() async {
    prefs = await SharedPreferences.getInstance();
    accessToken = prefs!.getString('accessToken');
    refreshToken = prefs!.getString('refreshToken');
    role = prefs!.getString('role');
    getuserDetails();
  }

  getuserDetails() async {
    http.Response res = await http.get(Uri.parse(base + "/userdetails"),
        headers: {'token': accessToken!});
    print("$accessToken");
    print("body>>>>>>>>>>>>>>>>>>>> ${res.body}");
    print("statusCode>>>>>>>>>>>>>>>>>>>> ${res.statusCode}");
    print("headers>>>>>>>>>>>>>>>>>>>> ${res.headers}");

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
      print(refreshToken!);
      res = await http.get(Uri.parse(base + "/newaccesstoken"),
          headers: {'token': refreshToken!});
      var newtokens = jsonDecode(res.body);
      print(newtokens);
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
