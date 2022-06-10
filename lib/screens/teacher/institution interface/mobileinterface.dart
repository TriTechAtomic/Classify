import 'package:classify/utils/buttons.dart';
import 'package:flutter/material.dart';

class MobileInterface extends StatelessWidget {
  MobileInterface({Key? key}) : super(key: key);

  final List<String> buttonsContent = [
    'Expected Pay',
    'Take Attendence',
    'View Schedule',
    'Total Lectures',
  ];

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

    void pathToOtherInterface(String check) {
      if (check == 'Expected Pay') {
      } else if (check == 'Take Attendence') {
      } else if (check == 'View Schedule') {}
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$check Clicked"),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          for (String e in buttonsContent)
            CustomButtons(
              text: e,
              height: mq.width * 0.3,
              width: mq.width * 0.43,
              callback: () {
                pathToOtherInterface(e);
              },
              padding: const EdgeInsets.all(8),
            )
        ],
      ),
    );
  }
}
