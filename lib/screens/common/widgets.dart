import 'package:classify/provider/authprovider.dart';
import 'package:classify/screens/admin/admin_side_drawer.dart' as d;
import 'package:classify/screens/common/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

logoutButton(context) {
  return d.MenuItem(
    title: "Logout",
    icon: const Icon(Icons.logout),
    press: () async {
      await (await SharedPreferences.getInstance()).clear();
      Provider.of<Auth>(context, listen: false).logout();
      Navigator.of(context).pushNamed(Signin.routename);
    },
    mode: null,
  );
}
