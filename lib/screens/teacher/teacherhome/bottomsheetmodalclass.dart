import 'package:flutter/material.dart';
import '../../../utils/buttons.dart';

class ShowModalContainer extends StatelessWidget {
  const ShowModalContainer({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  final InputDecoration textFieldInputDecoration = const InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
    label: Text("Class Invite link"),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, dimens) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    height: dimens.maxHeight * 0.25,
                    width: dimens.maxWidth * 0.75,
                    child: TextField(
                      decoration: textFieldInputDecoration,
                    ),
                  ),
                ),
                CustomButtons(
                  text: "Join",
                  height: dimens.maxHeight * 0.25,
                  width: dimens.maxWidth * 0.75,
                  color: const Color.fromARGB(255, 144, 145, 199),
                  textcolor: Colors.white,
                  borderradius: 20.0,
                  callback: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
