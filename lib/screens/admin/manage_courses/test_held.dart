import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class TestHeld extends StatefulWidget {
  const TestHeld({Key? key}) : super(key: key);

  @override
  State<TestHeld> createState() => _TestHeldState();
}

class _TestHeldState extends State<TestHeld> {
  DateTime date = DateTime.utc(2022, 06, 14);
  String? CourseName, SubjectName, TestName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search Here",
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: adminBackground)),
                  ),
                ),
              ),
              Wrap(
                children: [
                  for (int i = 1; i <= 10; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: testContainer(
                          "Course$i", "Subject$i", "TestNo$i", date),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector testContainer(
      String courseName, String subjectName, String testName, DateTime date) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$courseName  $subjectName  $testName  $date")));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              courseName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 3,
              width: 5,
            ),
            Text(
              subjectName,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 5,
              width: 5,
            ),
            Text(
              testName,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 214, 211, 211)),
            ),
            const SizedBox(
              height: 5,
              width: 5,
            ),
            Text(
              date.toString(),
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 214, 211, 211)),
            ),
          ],
        ),
      ),
    );
  }
}
