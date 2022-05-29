import 'package:classify/models/textfield_meta.dart';
import 'package:flutter/material.dart';

class TFrow extends StatelessWidget {
  final TFmeta data;
  final Size ss;
  const TFrow({Key? key, required this.data, required this.ss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: ss.width * 0.8,
            child: Padding(
              child: TextField(
                controller: data.controller,
                obscureText: data.ispass,
                decoration: InputDecoration(
                  labelText: data.hint,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13)),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
            )),
      ],
    );
  }
}
