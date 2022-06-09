import 'package:flutter/material.dart';
import '../../../utils/buttons.dart';
import '../../../utils/responsive.dart';

class TeacherHomeBody extends StatelessWidget {
  TeacherHomeBody({Key? key, required this.className}) : super(key: key);

  final String className;
  final radius = BorderRadius.circular(
    20.0,
  );

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

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
            child: Responsive(
              mobile: CustomButtons(
                text: 'Institution $className',
                height: 50,
                width: mq.width * 0.85,
                callback: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Institution $className"),
                    ),
                  );
                },
                borderradius: 20.0,
              ),
              tablet: CustomButtons(
                text: 'Institution $className',
                height: 50,
                width: mq.width * 0.7,
                callback: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Institution $className"),
                    ),
                  );
                },
                borderradius: 20.0,
              ),
              desktop: CustomButtons(
                text: 'Institution $className',
                height: 60,
                width: mq.width * 0.4,
                callback: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Institution $className"),
                    ),
                  );
                },
                borderradius: 20.0,
              ),
            )),
      ),
    );
  }
}
