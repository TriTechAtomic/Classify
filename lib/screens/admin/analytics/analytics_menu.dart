import 'package:classify/assets/asset_register.dart';
import 'package:classify/models/route_meta.dart';
import 'package:classify/screens/admin/features/announcemet.dart';
import 'package:classify/screens/admin/manage_courses/manage_courses.dart';
import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/colors.dart';
import 'package:classify/utils/responsive.dart';
import 'package:flutter/material.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);
  static const String routeName = '/analytics';

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Analytics")),
      backgroundColor: adminBackground,
      body: Wrap(
        children: [
          for (var ele in <RouteMeta>[
            RouteMeta("Fees From Students", ""),
            RouteMeta("Teachers Salary", ""),
            RouteMeta("Total Admissions", ""),
            RouteMeta("Total Farewell", ""),
            RouteMeta("Student's Pending Fees", ""),
            RouteMeta("Student's Full Paid", ""),
            RouteMeta("Total Test Held", ""),
            RouteMeta("Total Complaints", ""),
            RouteMeta("Total Lectures", ""),
          ])
            Padding(
              padding: const EdgeInsets.all(15),
              child: CustomButtons(
                text: ele.MetaName,
                height: 90,
                width: 150,
                callback: () {
                  Navigator.pushNamed(context, ele.routeName);
                },
              ),
            ),
        ],
      ),
    ));
  }
}
