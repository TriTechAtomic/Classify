import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

AppBar transperentAppBar({required BuildContext context}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: primaryColor,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
