String funabbreviatedCount(int num) {
  if (num < 1000) return "$num";
  if (num >= 1000 && num < 1000000) {
    String s = (num / 1000).toStringAsFixed(1);
    if (s.endsWith(".0")) {
      int idx = s.indexOf(".0");
      s = s.substring(0, idx);
    }
    return "${s}K";
  } else if (num >= 1000000 && num < 1000000000) {
    String s = (num / 1000000).toStringAsFixed(1);
    if (s.endsWith(".0")) {
      int idx = s.indexOf(".0");
      s = s.substring(0, idx);
    }
    return "${s}M";
  }
  return "";
}