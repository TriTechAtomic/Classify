import 'package:classify/screens/admin/timetable/create_TimeTable.dart';
import 'package:flutter/material.dart';

class TimeTables extends StatefulWidget {
  const TimeTables({Key? key}) : super(key: key);
  static const String routeName = '/TimeTables';

  @override
  State<TimeTables> createState() => _TimeTablesState();
}

class _TimeTablesState extends State<TimeTables> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("TimeTables")),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      borderSide: BorderSide()),
                ),
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateTimeTable.routeName);
        },
        child: Icon(Icons.add),
        tooltip: "Create New Time Table",
      ),
    ));
  }
}
