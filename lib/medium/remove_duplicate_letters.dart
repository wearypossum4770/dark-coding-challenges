String removeDuplicateLetters(String s) {
  Map<String, int> last = {};
  List<String> stack = [];
  Set<String> seen = {};
  for (int i = 0; i < s.length; i++) {
    last[s[i]] = i;
  }
  for (var i = 0; i < s.length; i++) {
    if (seen.contains(s[i])) continue;
    while (stack.isNotEmpty && stack.last.compareTo(s[i]) > 0 && (last[stack.last] ?? -1) > i) {
      seen.remove(stack.removeLast());
    }
    stack.add(s[i]);
    seen.add(s[i]);
  }
  return stack.join("");
}
