import 'package:bui/src/components/enum/print/print_pretty_colors.dart';
import 'package:bui/src/components/print/pretty/print_pretty_color_string.dart';

extension PrintPrettyColorsExtension on PrintPrettyColors {
  String get color {
    switch (this) {
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
      case PrintPrettyColors.cyan:
        return PrintPrettyColorsString.cyan;
      case PrintPrettyColors.white:
        return PrintPrettyColorsString.white;
      case PrintPrettyColors.reset:
        return PrintPrettyColorsString.reset;
      case PrintPrettyColors.blink:
        return PrintPrettyColorsString.blink;
      case PrintPrettyColors.bold:
        return PrintPrettyColorsString.bold;
      case PrintPrettyColors.underline:
        return PrintPrettyColorsString.underline;
      case PrintPrettyColors.stopUnderline:
        return PrintPrettyColorsString.stopUnderline;
      case PrintPrettyColors.regular:
        return PrintPrettyColorsString.regular;
      case PrintPrettyColors.purple:
        return PrintPrettyColorsString.purple;
      case PrintPrettyColors.yellowBackground:
        return PrintPrettyColorsString.yellowBackground;
      case PrintPrettyColors.lightYellow:
        return PrintPrettyColorsString.lightYellow;
    }
  }

  String get reset => PrintPrettyColorsString.reset;
}
