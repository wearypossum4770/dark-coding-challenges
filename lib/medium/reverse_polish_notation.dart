int performArithmetic(int a, int b, String operation) {
  switch (operation) {
    case "+":
      return a + b;
    case "-":
      return a - b;
    case "/":
      return a ~/ b;
    case "*":
      return a * b;
    default:
      return a + b;
  }
}

int reversePolishNotation(List<String> tokens) {
  List<int> stack = [];
  for (String token in tokens) {
    if ("+-/*".contains(token)) {
      int rhs = stack.removeLast();
      int lhs = stack.removeLast();
      stack.add(performArithmetic(lhs, rhs, token));
    } else {
      stack.add(int.parse(token));
    }
  }
  return stack.removeLast();
}
