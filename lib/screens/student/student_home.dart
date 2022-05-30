import 'package:flutter/material.dart';
import 'studentdrawer.dart';

class StudentHome extends StatelessWidget {
  StudentHome({Key? key}) : super(key: key);
  static const String routeName = '/studentHome';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MediaQuery.of(context).size.width <= 1100
          ? const StudentDrawer()
          : null,
      appBar: AppBar(
        title: const Text("Student Home"),
      ),
    );
  }
}
