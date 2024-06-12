class Utils {
  static String integerMinToString(int? min) {
    if (min == null) return "-";
    return"${(min/60).floor() } hours ${min%60}";
  }
}
