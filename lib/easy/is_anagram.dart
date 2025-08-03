bool isAnagram(String s, String t) {
  if (s == t) return true;
  if (s.length != t.length) return false;

  final frequency = <String, int>{};
  for (var char in s.split('')) {
    frequency[char] = (frequency[char] ?? 0) + 1;
  }
  for (var char in t.split('')) {
    var count = frequency[char] ?? 0;
    if (count < 1) return false;
    frequency[char] = count - 1;
  }
  for (var value in frequency.values) {
    if (value != 0) return false;
  }
  return true;
}
