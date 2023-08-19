import 'package:flutter/material.dart';

extension TextExtensions on Text {
  TextDirection get detectDirection {
    return RegExp(r'^[a-zA-Z0-9?><;,{}[\]\-_+=!@#$%^&*|]')
            .hasMatch(data ?? "")
        ? TextDirection.ltr
        : TextDirection.rtl;
  }

  TextAlign get detectAlign {
    return RegExp(r'^[a-zA-Z0-9?><;,{}[\]\-_+=!@#$%^&*|]')
        .hasMatch(data ?? "")
        ? TextAlign.left
        : TextAlign.right;
  }
}
