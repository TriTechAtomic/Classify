import 'package:flutter/cupertino.dart';

class TFmeta {
  String hint;
  TextEditingController controller = TextEditingController();
  bool ispass;
  int lineCount;

  TFmeta(this.hint, {this.ispass = false, this.lineCount = 1});
}
