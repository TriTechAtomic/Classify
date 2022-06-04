import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'StudentHomeHeader.dart';

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

  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.3,
            height: Responsive.isMobile(context) ? 40 : 55,
            child: CustomButtons(
              height: Responsive.isMobile(context) ? 40 : 55,
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width * 0.9
                  : MediaQuery.of(context).size.width * 0.15,
              text: "Payment History",
              callback: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.3,
            height: Responsive.isMobile(context) ? 40 : 55,
            child: CustomButtons(
              height: Responsive.isMobile(context) ? 40 : 55,
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width * 0.9
                  : MediaQuery.of(context).size.width * 0.3,
              text: "Complaints",
              callback: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.3,
            height: Responsive.isMobile(context) ? 40 : 55,
            child: CustomButtons(
              height: Responsive.isMobile(context) ? 40 : 55,
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width * 0.9
                  : MediaQuery.of(context).size.width * 0.3,
              text: "Time Table",
              callback: () {},
            ),
          ),
        ),
      ],
    );
  }
}
