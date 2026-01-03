bool repeatedSubstringPattern(String s) {
  if (s.isEmpty) return true;
  return (s + s).substring(1, s.length * 2 - 1).contains(s);
}
