import 'package:flutter/material.dart';

class CreateTimeTable extends StatefulWidget {
  const CreateTimeTable({Key? key}) : super(key: key);
  static const String routeName = '/CreateTimeTable';

  @override
  State<CreateTimeTable> createState() => _CreateTimeTableState();
}

class _CreateTimeTableState extends State<CreateTimeTable> {
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
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Create New Time Table"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<String>(
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
                  Table(children: [
                    TableRow(children: [
                      const Text("Null"),
                      dataField("Enter Time", 5, 8),
                      dataField("Enter Time", 5, 8),
                      dataField("Enter Time", 5, 8),
                      dataField("Enter Time", 5, 8),
                      dataField("Enter Time", 5, 8),
                      dataField("Enter Time", 5, 8),
                    ]),
                    TableRow(children: [
                      const Text("Sunday"),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                    ]),
                    TableRow(children: [
                      const Text("Monday"),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                    ]),
                    TableRow(children: [
                      const Text("Tuesday"),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                    ]),
                    TableRow(children: [
                      const Text("Wednesday"),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                    ]),
                    TableRow(children: [
                      const Text("Thursday"),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                    ]),
                    TableRow(children: [
                      const Text("Friday"),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                    ]),
                    TableRow(children: [
                      const Text("Satuarday"),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                      dataField("Enter Subject", 10, 8),
                    ]),
                  ]),
                ],
              ),
            ),
          )),
    );
  }

  Padding dataField(String hint, double bodrad, double pad) {
    return Padding(
      padding: EdgeInsets.all(pad),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(bodrad)),
        ),
      ),
    );
  }
}
