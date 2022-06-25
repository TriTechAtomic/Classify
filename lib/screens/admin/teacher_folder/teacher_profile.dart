import 'package:flutter/material.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({Key? key}) : super(key: key);
  static const String routeName = '/TeacherProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body:
          const Center(child: Text("Jai Bhavani")),
    );
  }
}
