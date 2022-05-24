import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:flutter/material.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key}) : super(key: key);

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  TFmeta username = TFmeta("Enter User Name");
  TFmeta instituteName = TFmeta("Enter Institute Name");
  TFmeta email = TFmeta("Enter Email");
  TFmeta password = TFmeta("Enter Password", ispass: true);
  TFmeta contact = TFmeta("enter Contact");
  TFmeta area = TFmeta("Enter Area");
  TFmeta city = TFmeta("Enter City");
  TFmeta state = TFmeta("Enter State");
  TFmeta pincode = TFmeta("Enter pincode");
  TFmeta instituteEmail = TFmeta("Enter Institute Email");
  List<TFmeta> controllers = [];

  @override
  void initState() {
    super.initState();
    controllers = [
      username,
      instituteName,
      email,
      password,
      contact,
      area,
      city,
      state,
      pincode,
      instituteEmail,
    ];
    for (var ele in controllers) {
      ele.controller.addListener(() {
        setState(() {});
      });
    }
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
            const FormHeading(name: "For\nAdmin Signup"),
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
