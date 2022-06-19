import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:classify/screens/widgets/transperent_app_bar.dart';
import 'package:classify/utils/auth/models/user.dart';
import 'package:classify/utils/auth/classify_auth.dart';
import 'package:flutter/material.dart';

import 'admin_home.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key}) : super(key: key);
  static const String routename = '/adminSignup';

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  final List<TFmeta> controllers = [
    TFmeta("Enter User Name"),
    TFmeta("Enter Password", ispass: true),
    TFmeta("Enter Institute Name"),
    TFmeta("Enter Email"),
    TFmeta("Enter Contact"),
    TFmeta("Enter State"),
    TFmeta("Enter City"),
    TFmeta("Enter pincode"),
    TFmeta("Enter Area"),
    TFmeta("Enter Subscription ID"),
  ];

  String buttonText = "Proceed";

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

  bool textfieldsAreValid() {
    for (var ele in controllers) {
      if (ele.controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size ss = MediaQuery.of(context).size;
    return Scaffold(
      appBar: transperentAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const FormHeading(name: "For\nAdmin Signup"),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: ss.width * 0.8,
                child: ListView(
                  children: [
                    for (var ele in controllers)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ele.controller,
                          obscureText: ele.ispass,
                          decoration: InputDecoration(
                            labelText: ele.hint,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13)),
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        textfieldsAreValid()
                            ? () async {
                                Institute t = Institute.fromTFMETA(controllers);
                                var instance = ClassifyAuth<Institute>();
                                setState(() {
                                  buttonText = "Signing up...";
                                });
                                var res = await instance.signUp(t);
                                setState(() {
                                  buttonText = "Logging in...";
                                });
                                if (res) {
                                  instance.signIn(t.email, t.password,
                                      'signinInstitute', context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("User already exists")));
                                }
                                Navigator.pushNamed(
                                    context, AdminHome.routeName);
                              }
                            : null;
                      },
                      child: Text(buttonText),
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
