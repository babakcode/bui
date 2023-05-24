import 'package:flutter/cupertino.dart';

extension TextEditingControllerExtensions on TextEditingController {
  TextDirection get detectDirection {
    return RegExp(r'^[a-zA-Z0-9?><;,{}[\]\-_+=!@#$%^&*|]').hasMatch(text)
        ? TextDirection.ltr
        : TextDirection.rtl;
  }
}
