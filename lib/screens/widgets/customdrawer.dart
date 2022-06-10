import 'package:classify/screens/common/widgets.dart';
import 'package:flutter/material.dart';
import '../../assets/asset_register.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer(
      {Key? key,
      required this.name,
      required this.email,
      required this.drawerItems})
      : super(key: key);

  final String name, email;
  final List<String> drawerItems;

  @override
  State<CustomDrawer> createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  IconData icon = Icons.light_mode_outlined;
  bool selected = true;
  List<bool> isSelected = [true];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 134,
                        width: 134,
                        child: Image.asset(AssetRegister.logoImg),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(widget.name),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 10, top: 5),
                  child: Text(
                    widget.email,
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: const Text("Theme"),
              onTap: () {
                setState(() {
                  selected = !selected;
                  icon = selected
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined;
                });
              },
              trailing: SizedBox(
                height: 40,
                child: ToggleButtons(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  isSelected: isSelected,
                  fillColor: Colors.white,
                  onPressed: (index) {
                    setState(() {
                      selected = !selected;
                      icon = selected
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined;
                    });
                  },
                  children: [
                    Icon(icon),
                  ],
                ),
              ),
            ),
          ),
          Draweritems(listwidgets: widget.drawerItems),
        ],
      ),
    );
  }
}

class Draweritems extends StatelessWidget {
  const Draweritems({Key? key, required this.listwidgets}) : super(key: key);

  final List<String> listwidgets;

  @override
  Widget build(BuildContext context) {
    void drawerNavidation(String nav) {
      if (nav == 'Rate us') {
      } else if (nav == 'Share') {
      } else if (nav == 'Contact us') {
      } else {}
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("$nav Clicked"),
        ),
      );
    }

    return Column(
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: Text(listwidgets[i]),
              onTap: () => drawerNavidation(listwidgets[i]),
            ),
          ),
        logoutButton(context)
      ],
    );
  }
}
