import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:group_radio_button/group_radio_button.dart';

import '../../models/textfield_meta.dart';
import '../widgets/proceed_button.dart';
import '../widgets/tf_flow.dart';

class AddStudents extends StatefulWidget {
  final VoidCallback flipper;
  const AddStudents({Key? key, required this.flipper}) : super(key: key);

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  final List<TFmeta> controllers = [
    TFmeta("Name of Student"),
    TFmeta("Age"),
    TFmeta("Phone number"),
    TFmeta("Parent Contact"),
    TFmeta("Address"),
    TFmeta("Advance Payment"),
    TFmeta("Total Fee"),
  ];
  String _verticalGroupValue = 'Male';
  final List<String> _status = ["Male", "Female", "Another"];
  final courses = [
    'Padai Likhai karo',
    'IAS YES bano',
    'or',
    'Desh ko sambhalo',
    '😎'
  ];

  String? seletedCourses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  widget.flipper();
                },
                icon: const Icon(Icons.close)),
            for (var ele in controllers)
              TFrow(data: ele, ss: MediaQuery.of(context).size),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: DropdownButton<String>(
                value: seletedCourses,
                hint: const Text("Select Course"),
                items: courses
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(),
                          ),
                        ))
                    .toList(),
                onChanged: (item) => setState(() {
                  seletedCourses = item;
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: DateTimePicker(
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date of Admission',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    "Chooce Gender Of Student",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  RadioGroup<String>.builder(
                    horizontalAlignment: MainAxisAlignment.center,
                    direction: Axis.horizontal,
                    groupValue: _verticalGroupValue,
                    onChanged: (value) => setState(() {
                      _verticalGroupValue = value!;
                    }),
                    items: _status,
                    itemBuilder: (item) => RadioButtonBuilder(
                      item,
                    ),
                  ),
                ],
              ),
            ),
            ProceedButton(
              ss: MediaQuery.of(context).size,
              text: "Admit",
              onPressed: () {
                Navigator.pushNamed(context, "");
              },
            ),
          ],
        ),
      ),
    );
  }
}
