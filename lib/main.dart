import 'package:classify/screens/admin/admin_home.dart';
import 'package:classify/screens/admin/features/manage_courses.dart';
import 'package:classify/screens/admin/signup.dart';
import 'package:classify/screens/common/role_selection.dart';
import 'package:classify/screens/common/signin.dart';
import 'package:classify/screens/parent/parent_home.dart';
import 'package:classify/screens/student/signup.dart';
import 'package:classify/screens/student/student_home.dart';
import 'package:classify/screens/teacher/signup.dart';
import 'package:classify/screens/teacher/teacher_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white),
      title: 'Material App',
      home: Signin(),
      routes: {
        // home Screens
        AdminHome.routeName: (context) => const AdminHome(),
        TeacherHome.routeName: (context) => const TeacherHome(),
        ParentHome.routeName: (context) => const ParentHome(),
        StudentHome.routeName: (context) => StudentHome(),

        // signup Screens
        AdminSignup.routename: (context) => const AdminSignup(),
        StudentSignup.routeName: (context) => const StudentSignup(),
        TeacherSignup.routeName: (context) => const TeacherSignup(),

        // common Signin Screen
        Signin.routename: (context) => Signin(),

        // role selection Screen
        RoleSelection.routeName: (context) => const RoleSelection(),

        //For admin Home
        '/ManageCourses': (context) => const ManageCourses(),
      },
    );
  }
}
