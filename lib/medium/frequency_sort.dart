String frequencySort(String s) {
  final freq = <int, int>{};
  for (var char in s.runes) {
    freq[char] = (freq[char] ?? 0) + 1;
  }
  List<MapEntry<int, int>> sorted = freq.entries.toList();
  sorted.sort((MapEntry<int, int> a, MapEntry<int, int> b) => b.value.compareTo(a.value));

  return sorted.map((MapEntry<int, int> a) => String.fromCharCode(a.key) * a.value).join("");
}
