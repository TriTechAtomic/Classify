import 'package:classify/screens/admin/admin_home.dart';
import 'package:classify/screens/admin/features/announcemet.dart';
import 'package:classify/screens/admin/features/manage_courses.dart';
import 'package:classify/screens/admin/signup.dart';
import 'package:classify/screens/common/role_selection.dart';
import 'package:classify/screens/common/signin.dart';
import 'package:classify/screens/parent/parent_home.dart';
import 'package:classify/screens/student/student_home.dart';
import 'package:classify/screens/teacher/signup.dart';
import 'package:classify/screens/teacher/teacher_home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
