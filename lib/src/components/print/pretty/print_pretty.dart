import 'dart:developer';
import 'package:bui/src/components/enum/print/print_pretty_colors.dart';
import 'package:bui/src/components/extensions/print_pretty/print_pretty_colors_extension.dart';

PrintPretty printPretty(
  String message, {
  String? name,
  PrintPrettyColors? printPrettyColor,
  Object? error,
}) =>
    PrintPretty(
      message,
      name: name,
      printPrettyColor: printPrettyColor,
      error: error,
    );

class PrintPretty {
  String? name;
  PrintPrettyColors? printPrettyColor;
  Object? error;

  PrintPretty(
    String message, {
    this.name,
    this.printPrettyColor,
    this.error,
  }) {
    log("${printPrettyColor?.color ?? ""}$message${printPrettyColor?.reset ?? ""}",
        error: error, name: name ?? "Pretty");
  }
}
