import 'package:bui/src/components/enum/print/print_pretty_colors.dart';
import 'package:bui/src/components/print/pretty/print_pretty_color_string.dart';

extension PrintPrettyColorsExtension on PrintPrettyColors{

  String get color {
    switch(this) {
      case PrintPrettyColors.blue:
        return PrintPrettyColorsString.blue;
      case PrintPrettyColors.red:
        return PrintPrettyColorsString.red;
      case PrintPrettyColors.green:
        return PrintPrettyColorsString.green;
      case PrintPrettyColors.black:
        return PrintPrettyColorsString.black;
      case PrintPrettyColors.yellow:
        return PrintPrettyColorsString.yellow;
      case PrintPrettyColors.magenta:
        return PrintPrettyColorsString.magenta;
      case PrintPrettyColors.cyan:
        return PrintPrettyColorsString.cyan;
      case PrintPrettyColors.white:
        return PrintPrettyColorsString.white;
      case PrintPrettyColors.reset:
        return PrintPrettyColorsString.reset;
    }
  }

  String get reset => PrintPrettyColorsString.reset;

}