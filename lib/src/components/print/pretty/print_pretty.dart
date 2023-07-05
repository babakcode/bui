import 'dart:convert';
import 'dart:developer';
import 'package:bui/src/components/enum/print/print_pretty_colors.dart';
import 'package:bui/src/components/extensions/print_pretty/print_pretty_colors_extension.dart';

export '../../enum/print/print_pretty_colors.dart';

PrintPretty printPretty(
  dynamic message, {
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
    dynamic message, {
    this.name,
    this.printPrettyColor,
    this.error,
  }) {
    try {
      if (message is String) {
        final obj = jsonDecode(message);
        if (obj is Map || obj is List) {
          var encoder = const JsonEncoder.withIndent("  ");
          List linesMessages = encoder.convert(obj).split('\n');
          for (final element in linesMessages) {
            log("${printPrettyColor?.color ?? ""}$element${printPrettyColor?.reset ?? ""}",
                error: error, name: name ?? "Pretty");
          }
          return;
        }
      }
    } catch (e) {
      log("${printPrettyColor?.color ?? ""}$message${printPrettyColor?.reset ?? ""}",
          error: error, name: name ?? "Pretty");
      return;
    }

    log("${printPrettyColor?.color ?? ""}$message${printPrettyColor?.reset ?? ""}",
        error: error, name: name ?? "Pretty");
  }
}
