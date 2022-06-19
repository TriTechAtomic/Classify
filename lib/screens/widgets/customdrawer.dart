import 'package:classify/screens/common/widgets.dart';
import 'package:flutter/material.dart';
import '../../assets/asset_register.dart';
import '../../models/route_meta.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer(
      {Key? key,
      required this.name,
      required this.email,
      required this.drawerItems})
      : super(key: key);

  final String name, email;
  final List<RouteMeta> drawerItems;

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
          CustomDrawerHeader(name: widget.name, email: widget.email),
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

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key, required this.name, required this.email})
      : super(key: key);

  final String name, email;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
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
            child: Text(name),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10, top: 5),
            child: Text(
              email,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class Draweritems extends StatelessWidget {
  const Draweritems({Key? key, required this.listwidgets}) : super(key: key);

  final List<RouteMeta> listwidgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (RouteMeta e in listwidgets)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: Text(e.MetaName),
              onTap: () => Navigator.pushNamed(context, e.routeName),
            ),
          ),
        logoutButton(context)
      ],
    );
  }
}
