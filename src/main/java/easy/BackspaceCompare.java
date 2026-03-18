package easy;

import java.util.ArrayList;
import java.util.List;

public class BackspaceCompare {
  public String process(String text) {
    List<Character> result = new ArrayList<>();
    for (char c : text.toCharArray()) {
      if (c == '#') {
        if (!result.isEmpty()) {
          result.removeLast();
        }
      } else {
        result.add(c);
      }
    }

    return result.toString();
  }

  public boolean solve(String s, String t) {
    return process(s).equals(process(t));
  }
}
