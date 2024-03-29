import 'package:flutter/material.dart';

extension StringExtensions on String {
  TextDirection get detectDirection {
    return RegExp(r'^[a-zA-Z0-9?><;,{}[\]\-_+=!@#$%^&*|]')
        .hasMatch(this)
        ? TextDirection.ltr
        : TextDirection.rtl;
  }

  TextAlign get detectAlign {
    return RegExp(r'^[a-zA-Z0-9?><;,{}[\]\-_+=!@#$%^&*|]')
        .hasMatch(this)
        ? TextAlign.left
        : TextAlign.right;
  }
}
