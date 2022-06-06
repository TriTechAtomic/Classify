import '../widgets/customdrawer.dart';
import 'package:flutter/material.dart';
import 'teacherhomecontent.dart';

class TeacherHome extends StatelessWidget {
  TeacherHome({Key? key}) : super(key: key);
  static const String routeName = '/teacherHome';
  final List<String> drawerWidgets = [
    "Rate us",
    "Share",
    "Contact us",
    "Credits",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MediaQuery.of(context).size.width < 1100
          ? CustomDrawer(
              name: "Dummy Name",
              email: "dummyemail@gmail.com",
              drawerItems: drawerWidgets,
            )
          : null,
      appBar: AppBar(
        leading: MediaQuery.of(context).size.width < 1100
            ? Builder(
                builder: (context) => // Ensure Scaffold is in context
                    IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            : null,
        automaticallyImplyLeading: false,
        title: const Text("Classify"),
      ),
      body: MediaQuery.of(context).size.width < 1100
          ? const TeacherHomeContents()
          : Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomDrawer(
                    name: "Dummy Name",
                    email: "dummyemail@gmail.com",
                    drawerItems: drawerWidgets,
                  ),
                ),
                const Expanded(
                  flex: 5,
                  child: TeacherHomeContents(),
                )
              ],
            ),
    );
  }
}
