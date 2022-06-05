import 'package:classify/screens/admin/admin_side_drawer.dart' as d;
import 'package:classify/screens/common/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

logoutButton(context) {
  return d.MenuItem(
    title: "Logout",
    icon: const Icon(Icons.logout),
    press: () async {
      var prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Navigator.of(context).pushNamed(Signin.routename);
    },
    mode: null,
  );
}
