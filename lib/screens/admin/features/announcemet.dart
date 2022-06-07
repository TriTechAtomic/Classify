import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);
  static const String routeName = '/Annoucement';

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Create Annoucement"),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter Subject",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                maxLines: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 8,
                decoration: InputDecoration(
                    hintText: "Enter Message",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
