import 'package:flutter/material.dart';

import '../../assets/asset_register.dart';

class StudentDrawer extends StatefulWidget {
  const StudentDrawer({Key? key}) : super(key: key);

  @override
  State<StudentDrawer> createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  IconData icon = Icons.light_mode_outlined;
  List<bool> isSelected = [true];
  List<String> drawerWidgets = [
    "Rate us",
    "Share",
    "Contact us",
    "Credits",
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(AssetRegister.logoImg),
          ),
          ListTile(
            title: const Text("Theme"),
            trailing: ToggleButtons(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              isSelected: isSelected,
              fillColor: Colors.white,
              borderColor: Colors.transparent,
              onPressed: (index) {
                setState(() {
                  isSelected[0] = !isSelected[0];
                  icon = isSelected[0]
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined;
                });
              },
              children: [
                Icon(icon),
              ],
            ),
          ),
          DrawerWidgets(listwidgets: drawerWidgets),
        ],
      ),
    );
  }
}

class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({Key? key, required this.listwidgets}) : super(key: key);

  final List<String> listwidgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (String item in listwidgets)
          ListTile(
            title: Text(item),
          ),
      ],
    );
  }
}
