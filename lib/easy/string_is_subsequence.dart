bool stringIsSubsequence(String s, t) {
  int left = 0;
  int right = 0;
  while (left < s.length && right < t.length) {
    if (s[left] == t[right]) {
      left++;
    }
    right++;
  }

  return left == s.length;
}
