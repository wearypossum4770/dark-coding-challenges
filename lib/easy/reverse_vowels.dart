bool isVowel(String s) => {"a", "e", "i", "o", "u"}.contains(s.toLowerCase());

String reverseVowels(String s) {
  if (s.length < 2) return s;
  List<String> result = List.filled(s.length, " ");
  int left = 0;
  int right = result.length - 1;
  while (left <= right) {
    if (!isVowel(s[right])) {
      result[right] = s[right];
      right--;
    } else if (!isVowel(s[left])) {
      result[left] = s[left];
      left++;
    } else {
      result[right] = s[left];
      result[left] = s[right];
      left++;
      right--;
    }
  }
  return result.join("");
}
