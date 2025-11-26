import 'package:collection/collection.dart';

List<String> topFrequentWords(List<String> words, int k) {
  var freq = <String, int>{};
  for (String word in words) {
    freq[word] = (freq[word] ?? 0) + 1;
  }
  var entries = freq.entries.toList();

  entries.sorted((a, b) {
    final compare = b.value.compareTo(a.value);
    if (compare != 0) return compare;
    return a.key.compareTo(b.key);
  });
  return entries.take(k).map((entry) => entry.key).toList();
}
