
abstract class PrintPrettyColorsString{
  static String get green => "\u001B[32m";
  static String get blink => "\u001B[5m";
  static String get cyan => "\u001B[36m";
  static String get white => "\u001B[37m";
  static String get bold => "\u001B[1m";
  static String get underline => "\u001B[4m";
  static String get stopUnderline => "\u001B[24m";
  static String get regular => "\u001B[21m";
  static String get blue => "\u001B[34m";
  static String get purple => "\u001B[35m";
  static String get yellow => "\u001B[33m";
  static String get yellowBackground => "\u001B[43m";
  static String get red => "\u001B[31m";
  static String get lightYellow => "\u001B[93m";
  static String get black => "\u001B[30m";
  static String get reset => "\u001B[0m";
}