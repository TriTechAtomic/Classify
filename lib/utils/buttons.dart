import 'package:classify/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatefulWidget {
  final String text;
  final double height, width;
  final Color? color;
  final Color? textcolor;
  final VoidCallback? callback;
  final double? borderradius;

  const CustomButtons({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    this.color,
    this.textcolor,
    this.callback,
    this.borderradius,
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
            color: widget.textcolor ?? (hovered ? Colors.white : Colors.black),
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          shape: widget.borderradius != null
              ? MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(widget.borderradius as double),
                  ),
                )
              : null,
          fixedSize:
              MaterialStateProperty.all(Size(widget.width, widget.height)),
          backgroundColor: widget.color != null
              ? MaterialStateProperty.all(widget.color)
              : MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(primaryColor),
        ));
  }
}
