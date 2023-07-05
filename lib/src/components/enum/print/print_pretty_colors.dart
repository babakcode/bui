import 'package:bui/src/components/print/pretty/print_pretty_color_string.dart';

enum PrintPrettyColors {
  green,
  blink,
  cyan,
  white,
  bold,
  underline,
  stopUnderline,
  regular,
  blue,
  purple,
  yellow,
  yellowBackground,
  red,
  lightYellow,
  black,
  reset;

  String get color => switch (this) {
        blue => PrintPrettyColorsString.blue,
        red => PrintPrettyColorsString.red,
        green => PrintPrettyColorsString.green,
        black => PrintPrettyColorsString.black,
        yellow => PrintPrettyColorsString.yellow,
        cyan => PrintPrettyColorsString.cyan,
        white => PrintPrettyColorsString.white,
        reset => PrintPrettyColorsString.reset,
        blink => PrintPrettyColorsString.blink,
        bold => PrintPrettyColorsString.bold,
        underline => PrintPrettyColorsString.underline,
        stopUnderline => PrintPrettyColorsString.stopUnderline,
        regular => PrintPrettyColorsString.regular,
        purple => PrintPrettyColorsString.purple,
        yellowBackground => PrintPrettyColorsString.yellowBackground,
        lightYellow => PrintPrettyColorsString.lightYellow,
      };

  String get resetColor => PrintPrettyColorsString.reset;

  String get error => PrintPrettyColorsString.red;
}
