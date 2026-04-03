int longestPalindrome(String s) {
  Map<int, int> freq = {};
  for (int char in s.codeUnits) {
    freq[char] = (freq[char] ?? 0) + 1;
  }
  int odds = freq.values.where((x) => x % 2 == 1).length;
  if (odds > 1) return s.length + 1 - odds;
  return s.length;
}
