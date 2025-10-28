bool check(String word) {
  int left = 0;
  int right = word.length - 1;
  while (left < right) {
    if (word[left] != word[right]) return false;
    left++;
    right--;
  }
  return true;
}

String findFirstPalindrome(List<String> words) {
  for (final word in words) {
    if (check(word)) return word;
  }
  return "";
}
