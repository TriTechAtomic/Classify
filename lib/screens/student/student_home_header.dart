import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class StudentHomeHeader extends StatelessWidget {
  const StudentHomeHeader({
    Key? key,
    required this.name,
    required this.contact,
    required this.age,
    required this.email,
    required this.parentsContact,
    required this.address,
  }) : super(key: key);

  final String name, contact, age, email, parentsContact, address;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(contact),
                Text(age),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 15.0, top: 10.0, bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(email),
                Text(parentsContact),
                Text(
                  address,
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
