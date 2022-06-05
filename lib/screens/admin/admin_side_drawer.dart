import 'package:classify/screens/common/widgets.dart';
import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class AdminSideDrawer extends StatefulWidget {
  const AdminSideDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminSideDrawer> createState() => _AdminSideDrawerState();
}

class _AdminSideDrawerState extends State<AdminSideDrawer> {
  bool appeareance = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
                child: Icon(
              Icons.account_circle,
              size: 35,
            )),
            MenuItem(
              title: "Billing",
              icon: const Icon(Icons.subscriptions),
              press: () {},
              mode: null,
            ),
            MenuItem(
              title: "Theme",
              icon: const Icon(Icons.phone_android),
              press: () {
                setState(() {
                  appeareance = !appeareance;
                });
              },
              mode: appeareance
                  ? Icon(Icons.dark_mode, color: primaryColor)
                  : Icon(Icons.light_mode_outlined, color: primaryColor),
            ),
            MenuItem(
              title: "Rate US",
              icon: const Icon(Icons.star),
              press: () {},
              mode: null,
            ),
            MenuItem(
              title: "Share",
              icon: const Icon(Icons.share),
              press: () {},
              mode: null,
            ),
            MenuItem(
              title: "Contact US",
              icon: const Icon(Icons.contact_support),
              press: () {},
              mode: null,
            ),
            MenuItem(
              title: "Feedback",
              icon: const Icon(Icons.feed_rounded),
              press: () {},
              mode: null,
            ),
            MenuItem(
              title: "Credits",
              icon: const Icon(Icons.developer_mode),
              press: () {},
              mode: null,
            ),
            logoutButton(context)
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback press;
  final Icon? mode;

  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    required this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: icon,
      title: Text(title),
      trailing: mode,
    );
  }
}
