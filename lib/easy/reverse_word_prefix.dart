String reverseWordPrefix(String word, String ch) {
  List<String> result = List.filled(word.length, "");
  int position = 0;
  for (int i = 0; i < word.length; i++) {
    if (word[i] == ch) {
      int left = i;
      int right = i + 1;
      while (left >= 0) {
        result[position++] = word[left--];
      }
      while (right < word.length) {
        result[position++] = word[right++];
      }
      return result.join("");
    }
  }
  return word;
}
