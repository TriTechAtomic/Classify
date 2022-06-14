import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:classify/screens/widgets/tf_flow.dart';
import 'package:flutter/material.dart';
import 'package:classify/models/textfield_meta.dart';

class CreateCustomClass extends StatefulWidget {
  final VoidCallback flipper;
  const CreateCustomClass({Key? key, required this.flipper}) : super(key: key);
  static const String routeName = '/CreateCustomClass';

  @override
  State<CreateCustomClass> createState() => _CreateCustomClassState();
}

class _CreateCustomClassState extends State<CreateCustomClass> {
  List<TFmeta> controllers = [
    TFmeta("Enter Class Name"),
    TFmeta("Fees Amount"),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    widget.flipper();
                  },
                  icon: const Icon(Icons.close)),
              Expanded(
                flex: 5,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ListView(
                    children: [
                      for (var ele in controllers)
                        TFrow(
                          data: ele,
                          ss: MediaQuery.of(context).size,
                        ),
                      TextButton(
                        onPressed: () {
                          controllers.add(
                            TFmeta("Add Subjects",
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    hint: Text("Assing Teacher"),
                                    items: const [
                                      DropdownMenuItem(
                                        value: "",
                                        child: Text("Teacher Name"),
                                      ),
                                      DropdownMenuItem(
                                        value: "",
                                        child: Text("Teacher Name"),
                                      ),
                                      DropdownMenuItem(
                                        value: "",
                                        child: Text("Teacher Name"),
                                      ),
                                      DropdownMenuItem(
                                        value: "",
                                        child: Text("Teacher Name"),
                                      ),
                                    ],
                                    onChanged: (e) => {},
                                    icon: null,
                                  ),
                                )),
                          );
                          setState(() {});
                        },
                        child: const Text(
                          "+Add More Subjects",
                          softWrap: true,
                          textAlign: TextAlign.end,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ProceedButton(
                        ss: MediaQuery.of(context).size,
                        text: "Create Your Class",
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
