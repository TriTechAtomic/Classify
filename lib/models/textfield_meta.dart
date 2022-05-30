import 'package:flutter/cupertino.dart';

class TFmeta {
  final String hint;
  final TextEditingController controller = TextEditingController();
  final bool ispass;
  final int? lineCount;

  TFmeta(this.hint, {this.ispass = false, this.lineCount = 1});
}
