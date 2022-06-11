import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class TeacherAttendence extends StatefulWidget {
  const TeacherAttendence({Key? key}) : super(key: key);
  static const String routeName = '/TeacherAttendence';

  @override
  State<TeacherAttendence> createState() => _TeacherAttendenceState();
}

class _TeacherAttendenceState extends State<TeacherAttendence> {
  final teachers = [
    'Hindustani bhau',
    'CarryMinatti',
    'John Wick',
    'Light Yagami',
    'L'
  ];

  String? seletedTeacher;
  DateTime seletedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  int durationOfLecture = 0;
  final courses = [
    'Padai Likhai karo',
    'IAS YES bano',
    'or',
    'Desh ko sambhalo',
    '😎'
  ];

  String? seletedCourses;

  final subjects = [
    'BalBharti',
    'KumarBharti',
    'or',
    'Sirf Bharti',
  ];
  String? seletedSubject;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Teacher's Attendence")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: seletedTeacher,
              hint: const Text("Select Teacher"),
              items: teachers
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(),
                        ),
                      ))
                  .toList(),
              onChanged: (item) => setState(() {
                seletedTeacher = item;
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: DateTimePicker(
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Date of Lecture Taken',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                DropdownButton<String>(
                  value: seletedSubject,
                  hint: const Text("Select Subject"),
                  items: subjects
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(),
                            ),
                          ))
                      .toList(),
                  onChanged: (item) => setState(() {
                    seletedSubject = item;
                  }),
                ),
                const SizedBox(
                  width: 30,
                ),
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
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _selectTime,
                    child: const Text("Enter Start Time")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${startTime.hour}:${startTime.minute}",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: _selectEndTime,
                    child: const Text("Enter End Time")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${endTime.hour}:${endTime.minute}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Total Duration: $durationOfLecture"),
            const SizedBox(
              height: 30,
            ),
            ProceedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.green,
                    content: Text("Attendence Marked Succesfully"),
                  ),
                );
              },
              text: "Done",
              ss: MediaQuery.of(context).size,
            )
          ],
        ),
      ),
    ));
  }

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: startTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (newTime != null) {
      setState(() {
        startTime = newTime;
      });
    }
  }

  void _selectEndTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: endTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (newTime != null) {
      setState(() {
        endTime = newTime;
        durationOfLecture = ((endTime.hour + 12) - startTime.hour);
      });
    }
  }
}
