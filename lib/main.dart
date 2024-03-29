import 'package:classify/provider/authprovider.dart';
import 'package:flutter/material.dart';
import './screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/admin/features/announcemet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      builder: (ctx, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Colors.white),
        title: 'Classify',
        home: const AuthValidator(),
        routes: {
          // home Screens
          AdminHome.routeName: (context) => const AdminHome(),
          TeacherHome.routeName: (context) => TeacherHome(),
          ParentHome.routeName: (context) => const ParentHome(),
          StudentHome.routeName: (context) => StudentHome(),

          // signup Screens
          AdminSignup.routename: (context) => const AdminSignup(),
          TeacherSignup.routeName: (context) => const TeacherSignup(),

          // common Signin Screen
          Signin.routename: (context) => const Signin(),

          // role selection Screen
          RoleSelection.routeName: (context) => const RoleSelection(),

          //For admin Home
          ManageCourses.routeName: (context) => const ManageCourses(),
          Announcement.routeName: (context) => const Announcement(),
        },
      ),
    );
  }
}

class AuthValidator extends StatelessWidget {
  const AuthValidator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance()
            .then((prefs) => prefs.getString('role')),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final role = snapshot.data;
            if (role == "Institute") {
              return const AdminHome();
            } else if (role == "Student") {
              return StudentHome();
            } else if (role == "Parent") {
              return const ParentHome();
            } else {
              return TeacherHome();
            }
          } else {
            return const Signin();
          }
        });
  }
}
