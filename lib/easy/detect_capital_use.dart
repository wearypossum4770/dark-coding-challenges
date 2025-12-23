bool detectCapitalUse(String word) {
  if (word == word.toLowerCase()) return true;
  bool capsLock = RegExp(r'^([A-Z]*)$').hasMatch(word);
  if (capsLock) return capsLock;
  for (int char in word.substring(1).codeUnits) {
    if (char < 97 || char > 122) return false;
  }
  return true;
}
