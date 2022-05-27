import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Here",
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (con, i) => const Adminmenu(),
              itemCount: 10,
            ),
          )
        ],
      ),
    ));
  }
}

class Adminmenu extends StatefulWidget {
  const Adminmenu({Key? key}) : super(key: key);

  @override
  State<Adminmenu> createState() => _AdminmenuState();
}

class _AdminmenuState extends State<Adminmenu> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        onHover: (e) {
          setState(() {
            hovering = e;
          });
        },
        child: Container(
          width: 0,
          height: 0,
          color: hovering ? primaryColor : accentColor,
          child: const Text("Manage Courses"),
        ),
      ),
    );
  }
}
