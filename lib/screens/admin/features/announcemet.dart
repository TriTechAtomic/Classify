import 'package:classify/screens/widgets/proceed_button.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);
  static const String routeName = '/Annoucement';

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final Atype = ['In Class', 'In Institution'];
  String? selectedType = "In Class";
  final AllClass = ['1', '2', '3', '4'];
  String? selectedclass;
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select Announcement Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Wrap(
                children: [
                  DropdownButton<String>(
                    value: selectedType,
                    items: Atype.map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(),
                          ),
                        )).toList(),
                    onChanged: (item) => setState(() {
                      selectedType = item;
                    }),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Visibility(
                    visible: selectedType == "In Class",
                    child: DropdownButton<String>(
                      value: selectedclass,
                      hint: const Text("Select Class"),
                      items: AllClass.map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(),
                            ),
                          )).toList(),
                      onChanged: (item) => setState(() {
                        selectedclass = item;
                      }),
                    ),
                  ),
                ],
              ),
              ProceedButton(
                  ss: MediaQuery.of(context).size,
                  text: "Announce",
                  onPressed: () {})
            ],
          ),
        ),
      ),
    ));
  }
}
