import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'student_home_header.dart';
import '../../../models/route_meta.dart';
import '../attendenceandtest/studentstats.dart';

class StudentHomeContents extends StatelessWidget {
  StudentHomeContents({Key? key}) : super(key: key);

  final String name = "Dummy Name",
      contact = "123456790",
      age = '20 yrs',
      email = "dummyemail@gmail.com",
      parentsContact = "0987654321",
      address = "Bsc I.T./18";

  final List<RouteMeta> buttonRoutes = [
    RouteMeta("Payment History", ""),
    RouteMeta("Analytics", StudentStatus.routeName),
    RouteMeta("Complaints", ""),
    RouteMeta("Time Table", ""),
  ];

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

    return Column(
      children: [
        StudentHomeHeader(
          name: name,
          contact: contact,
          age: age,
          email: email,
          parentsContact: parentsContact,
          address: address,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Pending fees: 20Rs",
                style: TextStyle(color: Colors.red),
              ),
              Text(
                "Paid fees: 10Rs",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
        for (RouteMeta e in buttonRoutes)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Responsive(
              mobile: CustomButtons(
                height: 40,
                width: mq.width * 0.9,
                text: e.MetaName,
                callback: () => Navigator.pushNamed(context, e.routeName),
              ),
              tablet: CustomButtons(
                height: 55,
                width: mq.width * 0.4,
                text: e.MetaName,
                callback: () => Navigator.pushNamed(context, e.routeName),
              ),
              desktop: CustomButtons(
                height: 55,
                width: mq.width * 0.4,
                text: e.MetaName,
                callback: () => Navigator.pushNamed(context, e.routeName),
              ),
            ),
          ),
      ],
    );
  }
}
