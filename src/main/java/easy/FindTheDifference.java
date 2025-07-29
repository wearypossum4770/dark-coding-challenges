package easy;

import java.util.HashMap;

public class FindTheDifference {
  public char solve(String s, String t) {
    HashMap<Character, Integer> counts = new HashMap<>();
    for (char c : s.toCharArray()) {
      counts.put(c, counts.getOrDefault(c, 0) + 1);
    }
    for (char c : t.toCharArray()) {
      counts.put(c, counts.getOrDefault(c, 0) - 1);
      if (counts.get(c) < 0) return c;
    }
    return ' ';
  }
}
