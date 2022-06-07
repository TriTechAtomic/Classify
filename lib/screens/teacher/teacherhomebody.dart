import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class TeacherHomeBody extends StatelessWidget {
  const TeacherHomeBody({Key? key, required this.className}) : super(key: key);

  final String className;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 30.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      height: Responsive.isMobile(context) ? 50 : 60,
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width * 0.85
          : (Responsive.isTablet(context)
              ? MediaQuery.of(context).size.width * 0.7
              : MediaQuery.of(context).size.width * 0.4),
      child: Row(
        children: [
          Text('Institution $className'),
        ],
      ),
    );
  }
}
