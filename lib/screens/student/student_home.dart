import 'package:classify/provider/authprovider.dart';
import 'package:provider/provider.dart';

import 'student_home_content.dart';
import 'package:flutter/material.dart';
import '../widgets/customdrawer.dart';

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

  final String name = "Dummy Name",
      contact = "123456790",
      age = '20 yrs',
      email = "dummyemail@gmail.com",
      parentsContact = "0987654321",
      address = "Bsc I.T./18";

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<Auth>(context).user;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: MediaQuery.of(context).size.width < 1100
            ? CustomDrawer(
                name: user?.username ?? "Dummy Name",
                email: user?.email ?? "dummyemail@gmail.com",
                drawerItems: drawerWidgets,
              )
            : null,
        appBar: AppBar(
          leading: MediaQuery.of(context).size.width < 1100
              ? Builder(
                  builder: (context) => // Ensure Scaffold is in context
                      IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () => Scaffold.of(context).openDrawer()),
                )
              : null,
          automaticallyImplyLeading: false,
          title: const Text("Classify"),
        ),
        body: MediaQuery.of(context).size.width < 1100
            ? StudentHomeContents()
            : Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomDrawer(
                      name: user?.username ?? 'name',
                      email: user?.email ?? "email",
                      drawerItems: drawerWidgets,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: StudentHomeContents(),
                  )
                ],
              ),
      ),
    );
  }
}
