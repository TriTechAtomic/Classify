import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatefulWidget {
  final String text;
  final double height, width;
  final VoidCallback? callback;

  const CustomButtons({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    this.callback,
  }) : super(key: key);

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
      onPressed: widget.callback,
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
