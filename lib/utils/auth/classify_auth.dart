import 'dart:convert';

import 'package:http/http.dart' show post, Response;
import 'package:shared_preferences/shared_preferences.dart';

class ClassifyAuth<T> {
  final String base = 'http://localhost:8000/';

  ClassifyAuth();

  signUp(T user) async {
    var response = await post(
        Uri.parse(base + "signup" + user.runtimeType.toString()),
        headers: {'Content-Type': 'application/json'},
        body: user.toString());
    return response.body;
  }

  Future<Response> signIn(
      String email, String password, String instance) async {
    var body = jsonEncode({
      'username_or_email': email,
      'password': password,
    });

    var response = await post(Uri.parse(base + instance),
        headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      var prefs = await SharedPreferences.getInstance();
      var tokens = jsonDecode(response.body);
      if (tokens.keys.contains('access_token')) {
        for (var e in [
          prefs.setString("role", instance.substring(6)),
          prefs.setString("access_token", tokens["access_token"]),
          prefs.setString("refresh_token", tokens["refresh_token"]),
        ]) {
          await e;
        }
      } else {
        throw Exception("Invalid Credentials");
      }
    }
    return response;
  }
}
