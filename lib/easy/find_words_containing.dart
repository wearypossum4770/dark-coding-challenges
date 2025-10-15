List<int> findWordsContaining(List<String> words, String x) {
  return words.indexed.where((entry) => entry.$2.contains(x)).map((entry) => entry.$1).toList();
}
