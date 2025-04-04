void reverseString(List<String> s) {
  String char = "";
  for (int left = 0, right = s.length - 1; left < right; left++, right--) {
    char = s[left];
    s[left] = s[right];
    s[right] = char;
  }
}
