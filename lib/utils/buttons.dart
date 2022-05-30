import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatefulWidget {
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
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onHover: (value) => setState(() {
        hovered = value;
      }),
      onPressed: () {
        Navigator.pushNamed(context, widget.screen);
      },
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: hovered ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold),
      ),
      style: ButtonStyle(
          fixedSize:
              MaterialStateProperty.all(Size(widget.width, widget.height)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(primaryColor)),
    );
  }
}
