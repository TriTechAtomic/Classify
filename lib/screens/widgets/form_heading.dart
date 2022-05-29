import 'package:classify/assets/asset_register.dart';
import 'package:classify/utils/styles.dart';
import 'package:flutter/material.dart';

class FormHeading extends StatelessWidget {
  final String name;
  const FormHeading({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ss = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: ss.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: ss.height * 0.25,
              width: ss.width * 0.35,
              child: Image.asset(
                AssetRegister.logoImg,
                fit: BoxFit.contain,
                isAntiAlias: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 10, right: 20, top: 10, bottom: 10),
              color: Colors.black12,
              width: 2,
              height: ss.height * 0.1,
            ),
            SizedBox(
              width: ss.width * 0.3,
              child: Text(
                name,
                style: TextDecor.titleTextDecoration,
                softWrap: true,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
