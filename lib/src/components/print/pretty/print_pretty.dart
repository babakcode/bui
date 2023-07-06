import 'dart:convert';
import 'package:bui/src/components/enum/print/print_pretty_colors.dart';
import 'package:flutter/foundation.dart';

export '../../enum/print/print_pretty_colors.dart';

void printPretty(
  String message, {
  String? name,
  PrintPrettyColors? printPrettyColor,
  dynamic json, Object? error,
}) {
  try {
    if (json is Map || json is List) {
      return _print(json, name, message, printPrettyColor, error);
    } else if (json is String) {
      final obj = jsonDecode(json);
      if (obj is Map || obj is List) {
        return _print(obj, name, message, printPrettyColor, error);
      }
    }else{
      return _print(null, name, message, printPrettyColor, error);
    }
  } catch (e) {
    return;
  }
}

void _print(
  dynamic obj,
  String? name,
  String? message,
  PrintPrettyColors? printPrettyColor,
  Object? error,
) {
  if (kDebugMode) {
    print("${name == null ? "" : "[$name]"} $message");

    if(obj != null){
      var encoder = const JsonEncoder.withIndent("  ");
      List linesMessages = encoder.convert(obj).split('\n');

      for (final element in linesMessages) {
        print("${printPrettyColor?.color ?? ""}"
            "$element${printPrettyColor?.resetColor ?? ""}");
      }
    }

    printPrettyColor ??= PrintPrettyColors.red;

    print("${printPrettyColor.error}$error${printPrettyColor.resetColor}");
  }
}

// sealed class PrintPretty {
//   String? name;
//   PrintPrettyColors? printPrettyColor;
//   Object? error;
//   dynamic json;
//
//   PrintPretty(
//     String message, {
//     this.name,
//     this.json,
//     this.printPrettyColor,
//   }) {
//   }
//
//   PrintPretty.error(
//     String message, {
//     this.name,
//     this.printPrettyColor,
//     this.error,
//   }) {
//     if (kDebugMode) {
//       try {
//         if (json is String) {
//           final obj = jsonDecode(json);
//           if (obj is Map || obj is List) {
//             var encoder = const JsonEncoder.withIndent("  ");
//             List linesMessages = encoder.convert(obj).split('\n');
//
//             print("${name == null ? "" : "[$name]"} $message");
//             for (final element in linesMessages) {
//               print(
//                   "${printPrettyColor?.color ?? ""}$element${printPrettyColor?.reset ?? ""}");
//             }
//             print("${printPrettyColor?.error ?? ""}$element${printPrettyColor?.reset ?? ""}");
//           }
//           return;
//         }
//       } catch (e) {
//         return;
//       }
//
//       log("${printPrettyColor?.color ?? ""}$message${printPrettyColor?.reset ?? ""}",
//           error: error, name: name ?? "Pretty");
//     }
//   }
// }
