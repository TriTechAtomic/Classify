import 'package:flutter/material.dart';
import '../widgets/customdrawer.dart';
import 'StudentHomeHeader.dart';

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
      address = "Dummy address";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          name: "Dummy Name",
          email: "dummyemail@gmail.com",
          drawerItems: drawerWidgets,
        ),
        // appBar: AppBar(
        //   toolbarHeight: 120,
        //   title: Padding(
        //     padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(name),
        //         Text(contact),
        //         Text(age),
        //       ],
        //     ),
        //   ),
        //   actions: [
        //     Padding(
        //       padding:
        //           const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           Text(email),
        //           Text(parentsContact),
        //           Text(address),
        //         ],
        //       ),
        //     ),
        //   ],
        //   // title: const Text("Student Home"),
        // ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: StudentHomeHeader(
            name: name,
            contact: contact,
            age: age,
            email: email,
            parentsContact: parentsContact,
            address: address,
          ),
        ),
        // body: Column(
        //   children: [
        //     StudentHomeHeader(
        //       name: name,
        //       contact: contact,
        //       age: age,
        //       email: email,
        //       parentsContact: parentsContact,
        //       address: address,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: const [
        //           Text("Pending fees: Pending fees"),
        //           Text("Paid fees: paid fees")
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
