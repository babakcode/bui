import 'package:flutter/material.dart';

class ModelChangeable {
  String? tag;
  ValueNotifier<String?> valueNotifier = ValueNotifier(null);

  ModelChangeable({this.tag});
}
