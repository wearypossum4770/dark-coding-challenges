String processBackspaceCompare(String text) {
  List<int> result = [];
  for (int char in text.codeUnits) {
    if (char == 35) {
      if (result.isNotEmpty) {
        result.removeLast();
      }
    } else {
      result.add(char);
    }
  }
  return result.toString();
}

bool backspaceCompare(String s, String t) {
  return processBackspaceCompare(s) == processBackspaceCompare(t);
}
