import 'package:flutter/material.dart';
import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/widgets/form_heading.dart';

class StudentSignup extends StatefulWidget {
  const StudentSignup({Key? key}) : super(key: key);

  @override
  State<StudentSignup> createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentSignup> {
  TFmeta instituteCode = TFmeta("Enter Institute Code");
  TFmeta username = TFmeta("Enter User Name");
  TFmeta email = TFmeta("Enter Email");
  TFmeta password = TFmeta("Enter Password", ispass: true);
  TFmeta contact = TFmeta("Enter Contact");
  TFmeta parentsContact = TFmeta("Enter Parents Number");
  TFmeta gender = TFmeta("Enter Gender");
  TFmeta age = TFmeta("Enter age");
  TFmeta address = TFmeta("Enter address");
  List<TFmeta> controllers = [];

  @override
  void initState() {
    super.initState();
    controllers = [
      instituteCode,
      username,
      email,
      password,
      contact,
      parentsContact,
      gender,
      age,
      address
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FormHeading(name: "For Student Signup"),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ListView(
                  children: [
                    for (var ele in controllers)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ele.controller,
                          decoration: InputDecoration(
                            labelText: ele.hint,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text('Proceed'),
      ),
    );
  }
}
