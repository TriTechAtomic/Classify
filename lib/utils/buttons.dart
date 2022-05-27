import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final String text;
  final String screen;
  final double height, width;
  const CustomButtons(
      {Key? key,
      required this.text,
      required this.height,
      required this.width,
      required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, screen);
      },
      child: Text(text),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(width, height)),
          backgroundColor: MaterialStateProperty.all(accentColor),
          overlayColor: MaterialStateProperty.all(primaryColor)),
    );
  }
}
