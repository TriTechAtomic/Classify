import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:flutter/material.dart';
import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/widgets/form_heading.dart';

class StudentSignup extends StatefulWidget {
  const StudentSignup({Key? key}) : super(key: key);

  @override
  State<StudentSignup> createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentSignup> {
  List<TFmeta> controllers = [
    TFmeta("Enter Institute Code"),
    TFmeta("Enter User Name"),
    TFmeta("Enter Email"),
    TFmeta("Enter Password", ispass: true),
    TFmeta("Enter Contact"),
    TFmeta("Enter Parents Number"),
    TFmeta("Enter Gender"),
    TFmeta("Enter age"),
    TFmeta("Enter address"),
  ];

  @override
  void initState() {
    super.initState();
    for (var ele in controllers) {
      ele.controller.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var ele in controllers) {
      ele.controller.dispose();
    }
    super.dispose();
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
            const FormHeading(name: "For\nStudent Signup"),
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
                    ProceedButton(
                      ss: MediaQuery.of(context).size,
                      text: "Proceed",
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
