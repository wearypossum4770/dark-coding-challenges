String reverseWordsInString(String s) {
  List<String> words = s.trim().split(RegExp(r'\s+'));
  List<String> result = [];
  for (int i = words.length - 1; i >= 0; i--) {
    result.add(words[i]);
  }
  return result.join(" ");
}
