import 'package:classify/provider/authprovider.dart';
import 'package:classify/utils/auth/models/user.dart';
import 'package:provider/provider.dart';

import '../../widgets/customdrawer.dart';
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
    Teacher? teach = Provider.of<Auth>(context).user;
    return Scaffold(
      drawer: MediaQuery.of(context).size.width < 1100
          ? CustomDrawer(
              name: teach?.username ?? "loading",
              email: teach?.email ?? "loading",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: CustomDrawer(
                      name: teach?.username ?? "loading",
                      email: teach?.email ?? "loading",
                      drawerItems: drawerWidgets,
                    )),
                const Expanded(
                  flex: 5,
                  child: TeacherHomeContents(),
                )
              ],
            ),
    );
  }
}
