import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class AttendeesListName extends StatefulWidget {
  const AttendeesListName({Key? key, required this.studentName})
      : super(key: key);

  final String studentName;

  @override
  State<AttendeesListName> createState() => _AttendeesListNameState();
}

class _AttendeesListNameState extends State<AttendeesListName> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(widget.studentName),
            const Spacer(flex: 7),
            Container(
              height: 30,
              width: 0.9,
              color: lightThemeDividerColor,
            ),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: isChecked,
                onChanged: (onChecked) =>
                    setState(() => isChecked = onChecked as bool),
              ),
            )
          ],
        ),
        const Divider(
          color: lightThemeDividerColor,
          thickness: 1,
        )
      ],
    );
  }
}
