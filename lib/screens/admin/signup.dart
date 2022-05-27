import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:classify/screens/widgets/tf_flow.dart';
import 'package:classify/screens/widgets/transperent_app_bar.dart';
import 'package:flutter/material.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key}) : super(key: key);
  static const String routename = '/adminSignup';

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  final List<TFmeta> controllers = [
    TFmeta("Enter User Name"),
    TFmeta("Enter Institute Name"),
    TFmeta("Enter Email"),
    TFmeta("Enter Password", ispass: true),
    TFmeta("Enter Contact"),
    TFmeta("Enter Area"),
    TFmeta("Enter City"),
    TFmeta("Enter State"),
    TFmeta("Enter pincode"),
    TFmeta("Enter Institute Email"),
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
              child: ListView(
                children: [
                  for (var ele in controllers) TFrow(data: ele, ss: ss),
                  ProceedButton(
                    ss: ss,
                    text: "Proceed",
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
