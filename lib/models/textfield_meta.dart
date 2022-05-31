import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/dropdown.dart';

class TFmeta {
  final String hint;
  final TextEditingController controller = TextEditingController();
  final bool ispass;
  final int lineCount;
  final Widget? trailing;

  TFmeta(this.hint, {this.ispass = false, this.lineCount = 1, this.trailing});
}
