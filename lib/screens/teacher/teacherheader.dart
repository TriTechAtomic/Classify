import 'package:flutter/cupertino.dart';
import '../../utils/colors.dart';

class TeacherHeader extends StatelessWidget {
  const TeacherHeader({
    Key? key,
    required this.name,
    required this.contact,
    required this.email,
    required this.keysubject,
  }) : super(key: key);

  final String name, contact, email, keysubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: adminBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(contact),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 15.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(email),
                Text(keysubject),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
