import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:classify/screens/widgets/tf_flow.dart';
import 'package:classify/utils/styles.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);
  final List<TFmeta> controllers = [
    TFmeta("Enter User Name / Email"),
    TFmeta("Enter password", ispass: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const FormHeading(name: "Signin"),
              Column(),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var ele in controllers)
                      TFrow(data: ele, ss: MediaQuery.of(context).size),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text("Forgot Password?")),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProceedButton(
                        ss: MediaQuery.of(context).size,
                        text: "Sign in",
                        onPressed: () {
                          //Login Karo
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "New Here?",
                              style: TextDecor.titleTextDecoration
                                  .copyWith(fontSize: 20),
                            ),
                          ),
                          TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, '/roleSelection'),
                              child: Text("Signup ?",
                                  style: TextDecor.titleTextDecoration.copyWith(
                                      fontSize: 20, color: Colors.deepPurple))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
