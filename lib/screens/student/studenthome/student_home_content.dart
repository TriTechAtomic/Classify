import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'student_home_header.dart';

class StudentHomeContents extends StatelessWidget {
  StudentHomeContents({Key? key}) : super(key: key);

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
      address = "Bsc I.T./18";

  final List<String> buttonText = [
    "Payment History",
    "Complaints",
    "Time Table"
  ];

  @override
  Widget build(BuildContext context) {
    final Size mq = MediaQuery.of(context).size;

    void showbottomtext(e) {
      String text;
      if (e == buttonText[0]) {
        text = "Payment History";
      } else if (e == buttonText[1]) {
        text = "Complaints";
      } else if (e == buttonText[2]) {
        text = "Time Table";
      } else {
        text = "nigge";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$text button Clicked'),
        ),
      );
    }

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
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Responsive(
              mobile: CustomButtons(
                height: 40,
                width: mq.width * 0.9,
                text: buttonText[i],
                callback: () => showbottomtext(buttonText[i]),
              ),
              tablet: CustomButtons(
                height: 55,
                width: mq.width * 0.4,
                text: buttonText[i],
                callback: () => showbottomtext(buttonText[i]),
              ),
              desktop: CustomButtons(
                height: 55,
                width: mq.width * 0.4,
                text: buttonText[i],
                callback: () => showbottomtext(buttonText[i]),
              ),
            ),
          ),
      ],
    );
  }
}
