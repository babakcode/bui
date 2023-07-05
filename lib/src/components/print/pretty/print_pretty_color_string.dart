
abstract class PrintPrettyColorsString{
  static String get blue => "\x1B[34m";
  static String get red => "\x1B[31m";
  static String get green => "\x1B[32m";
  static String get black => "\x1B[30m";
  static String get yellow => "\x1B[33m";
  static String get magenta => "\x1B[35m";
  static String get cyan => "\x1B[36m";
  static String get white => "\x1B[37m";
  static String get reset => "\x1B[0m";
}