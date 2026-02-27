List<int> sortByBits(List<int> arr) {
  Map<int, List<int>> freq = {};
  for (int n in arr) {
    int count = 0;
    for (final c in n.toRadixString(2).runes) {
      if (c == 49) count++;
    }
    List<int> previous = freq[count] ?? [];
    previous.add(n);
    freq[count] = previous;
    for (var list in freq.values) {
      list.sort();
    }
  }
  return [for (final entry in freq.entries.toList()..sort((a, b) => a.key.compareTo(b.key))) ...entry.value];
}
