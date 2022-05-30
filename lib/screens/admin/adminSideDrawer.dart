import 'package:flutter/material.dart';

class AdminSideDrawer extends StatelessWidget {
  const AdminSideDrawer({
    Key? key,
  }) : super(key: key);

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
                press: () {}),
            MenuItem(
                title: "Theme",
                icon: const Icon(Icons.phone_android),
                press: () {}),
            MenuItem(
                title: "Rate US", icon: const Icon(Icons.star), press: () {}),
            MenuItem(
                title: "Share", icon: const Icon(Icons.share), press: () {}),
            MenuItem(
                title: "Contact US",
                icon: const Icon(Icons.contact_support),
                press: () {}),
            MenuItem(
                title: "Feedback",
                icon: const Icon(Icons.feed_rounded),
                press: () {}),
            MenuItem(
                title: "Credits",
                icon: const Icon(Icons.developer_mode),
                press: () {}),
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

  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: icon,
      title: Text(title),
    );
  }
}
