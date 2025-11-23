package medium;

import java.util.ArrayList;
import java.util.List;

public class ReversePolishNotation {
  public int solve(String[] tokens) {
    List<Integer> stack = new ArrayList<>();
    for (String c : tokens) {
      if (!"+-/*".contains(c)) {
        stack.add(Integer.parseInt(c));
        continue;
      }
      int rhs = stack.remove(stack.size() - 1);
      int lhs = stack.remove(stack.size() - 1);
      switch (c) {
        case "+":
          stack.add(lhs + rhs);
          break;
        case "-":
          stack.add(lhs - rhs);
          break;
        case "/":
          stack.add(lhs / rhs);
          break;
        case "*":
          stack.add(lhs * rhs);
          break;
        default:
          break;
      }
    }
    return stack.getLast();
  }
}
