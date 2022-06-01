import 'package:classify/screens/student/student_home_content.dart';
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
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: MediaQuery.of(context).size.width < 1100
            ? CustomDrawer(
                name: "Dummy Name",
                email: "dummyemail@gmail.com",
                drawerItems: drawerWidgets,
              )
            : null,
        appBar: AppBar(
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
                      name: "Dummy Name",
                      email: "dummyemail@gmail.com",
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
