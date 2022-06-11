import 'package:classify/provider/authprovider.dart';
import 'package:classify/screens/admin/admission/student_account.dart';
import 'package:classify/screens/admin/timetable/create_TimeTable.dart';
import 'package:classify/screens/admin/features/analytics/analytics_menu.dart';
import 'package:classify/screens/admin/features/manage_students.dart';
import 'package:classify/screens/admin/features/manage_teachers.dart';
import 'package:classify/screens/admin/features/teachers_attendence.dart';
import 'package:classify/screens/admin/timetable/timetables.dart';
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
          Analytics.routeName: (context) => const Analytics(),
          ManageStudents.routeName: (context) => ManageStudents(),
          ManageTeachers.routeName: (context) => const ManageTeachers(),
          TeacherAttendence.routeName: (context) => const TeacherAttendence(),
          StudentAccount.routeName: (context) => const StudentAccount(),
          TimeTables.routeName:(context) => const TimeTables(),
          CreateTimeTable.routeName:(context) =>  const CreateTimeTable(),
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
