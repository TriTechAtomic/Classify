import 'package:flutter/material.dart';

class StudentAccount extends StatelessWidget {
  const StudentAccount({Key? key}) : super(key: key);
  static const String routeName = '/StudentAccount';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.pink,
            appBar: AppBar(
              title: const Text("New Admission"),
            )));
  }
}
