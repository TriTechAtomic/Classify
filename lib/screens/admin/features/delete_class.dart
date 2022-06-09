import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class DeleteClass extends StatefulWidget {
  DeleteClass({Key? key}) : super(key: key);

  @override
  State<DeleteClass> createState() => _DeleteClassState();
}

class _DeleteClassState extends State<DeleteClass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
            ],
          ),
        ),
      ),
    ));
  }
}
