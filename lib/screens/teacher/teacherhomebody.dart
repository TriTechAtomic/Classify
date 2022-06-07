import 'package:classify/utils/buttons.dart';
import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class TeacherHomeBody extends StatelessWidget {
  TeacherHomeBody({Key? key, required this.className}) : super(key: key);

  final String className;
  final radius = BorderRadius.circular(
    20.0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 8.0),
      child: InkWell(
        borderRadius: radius,
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: radius),
          child: CustomButtons(
            text: 'Institution $className',
            height: Responsive.isMobile(context) ? 50 : 60,
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width * 0.85
                : (Responsive.isTablet(context)
                    ? MediaQuery.of(context).size.width * 0.7
                    : MediaQuery.of(context).size.width * 0.4),
            callback: () {},
            borderradius: 20.0,
          ),
        ),
      ),
    );
  }
}
