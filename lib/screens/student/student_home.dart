import 'package:flutter/material.dart';
import '../widgets/customdrawer.dart';
<<<<<<< HEAD
=======
>>>>>>> 7cc771d7e2da6e1a0a4e36aed9eef305d0d4b3cb

class StudentHome extends StatelessWidget {
  StudentHome({Key? key}) : super(key: key);
  static const String routeName = '/studentHome';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> drawerWidgets = [
    "Rate us",
    "Share",
    "Contact us",
    "Credits",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        name: "Dummy Name",
        email: "dummyemail@gmail.com",
        drawerItems: drawerWidgets,
      ),
      appBar: AppBar(
        title: const Text("Student Home"),
      ),
    );
  }
}
