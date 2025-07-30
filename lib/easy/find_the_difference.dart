String findTheDifference(String s, String t) {
  final Map<String, int> counts = {};
  for (var char in s.split("")) {
    counts[char] = (counts[char] ?? 0) + 1;
  }
  for (var char in t.split("")) {
    final currentCount = (counts[char] ?? 0) - 1;
    counts[char] = currentCount;
    if (currentCount < 0) return char;
  }

  return "";
}
