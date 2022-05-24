import 'package:classify/models/textfield_meta.dart';
import 'package:classify/screens/widgets/form_heading.dart';
import 'package:flutter/material.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key}) : super(key: key);

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  final List<TFmeta> controllers = [
    TFmeta("Enter User Name"),
    TFmeta("Enter Institute Name"),
    TFmeta("Enter Email"),
    TFmeta("Enter Password", ispass: true),
    TFmeta("enter Contact"),
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
    return Scaffold(
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
                          obscureText: ele.ispass,
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
