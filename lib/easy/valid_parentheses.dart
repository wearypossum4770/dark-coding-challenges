bool validParentheses(String text) {
  if (text.isEmpty) return true;
  var stack = <String>[];
  Map<String, String> brackets = {'(': ')', '{': '}', '[': ']'};
  for (var i = 0; i < text.length; i++) {
    if (brackets.containsKey(text[i])) {
      stack.add(text[i]);
    } else {
      if (stack.isEmpty || brackets[stack.last] != text[i]) {
        return false;
      }
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}
