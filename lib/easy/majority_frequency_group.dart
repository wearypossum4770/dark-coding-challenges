import 'package:collection/collection.dart';

String majorityFrequencyGroup(String s) {
  Map<String, int> freq = {};
  Map<int, String> entries = {};
  for (String c in s.split("")) {
    freq[c] = (freq[c] ?? 0) + 1;
  }
  for (MapEntry<String, int> entry in freq.entries) {
    entries[entry.value] = (entries[entry.value] ?? "") + entry.key;
  }
  return entries.entries
      .sortedByCompare((e) => e, (a, b) {
        int diff = b.value.length - a.value.length;
        if (diff != 0) return diff;
        return b.key - a.key;
      })
      .first
      .value;
}
