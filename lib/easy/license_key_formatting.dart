String licenseKeyFormatting(String s, int k) {
  final buffer = StringBuffer();
  String word = s.replaceAll("-", "").toUpperCase();
  int left = 0;
  for (int i = word.length - 1; i >= 0; i--) {
    if (left == k) {
      buffer.write("-");
      left = 0;
    }
    buffer.write(word[i]);
    left++;
  }
  return buffer.toString().split("").reversed.join();
}
