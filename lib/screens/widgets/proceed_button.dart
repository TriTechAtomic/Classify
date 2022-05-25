import 'package:classify/utils/styles.dart';
import 'package:flutter/material.dart';

class ProceedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const ProceedButton(
      {Key? key, required this.ss, required this.text, this.onPressed})
      : super(key: key);

  final Size ss;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(ss.width * 0.5, 40)),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextDecor.titleTextDecoration.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
