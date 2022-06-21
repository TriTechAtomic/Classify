import 'package:classify/utils/buttons.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class InviteTeacher extends StatefulWidget {
  const InviteTeacher({Key? key}) : super(key: key);

  @override
  State<InviteTeacher> createState() => _InviteTeacherState();
}

class _InviteTeacherState extends State<InviteTeacher> {
  final subjects = [
    'BalBharti',
    'KumarBharti',
    'or',
    'Sirf Bharti',
  ];

  String? seletedSubject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: adminBackground,
        body: SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: const TextField(
                      decoration: InputDecoration(
                        
                        hintText: "Search By UserName",
                        suffixIcon: Icon(Icons.search),
                        
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  DropdownButton<String>(
                    value: seletedSubject,
                    hint: const Text("Search By Key Subject"),
                    items: subjects
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(),
                              ),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() {
                      seletedSubject = item;
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              
              ListView.builder(
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return results("Akas", "25", "Phd", "Hindi");
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Container results(String username, String experiance, String qualification,
      String keySubject) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: primaryColor)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "User Name - $username",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  "Teaching Since $experiance yrs",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("qualification: $qualification"),
                Text.rich(TextSpan(text: "Key Subject: ", children: <TextSpan>[
                  TextSpan(
                      text: " $keySubject",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold))
                ])),
              ],
            ),
            CustomButtons(
              text: "Send Invite",
              height: 50,
              width: 130,
              color: primaryColor,
              textcolor: Colors.white,
              callback: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Invite Sent Successfully")));
              },
            )
          ],
        ));
  }
}
