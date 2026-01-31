String nextGreatestLetter(List<String> letters, String target) {
  for (String char in letters) {
    if (target.compareTo(char) < 0) return char;
  }
  return letters[0];
}
