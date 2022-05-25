import 'package:classify/screens/admin/admin_home.dart';
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
        '/adminHome': (context) => const AdminHome(),
        '/teacherHome': (context) => const TeacherHome(),
        '/parentHome': (context) => const ParentHome(),
        '/studentHome': (context) => const StudentHome(),

        // signup Screens
        '/adminSignup': (context) => const AdminSignup(),
        '/studentSignup': (context) => const StudentSignup(),
        '/teacherSignup': (context) => const TeacherSignup(),

        // common Signin Screen
        '/signin': (context) => Signin(),

        // role selection Screen
        '/roleSelection': (context) => const RoleSelection(),
      },
    );
  }
}
