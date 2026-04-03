package easy;

import java.util.HashMap;

public class LongestPalindrome {
  public int solve(String s) {
    int n = s.length();
    HashMap<Character, Integer> freq = new HashMap<>();
    for (char c : s.toCharArray()) {
      freq.put(c, freq.getOrDefault(c, 0) + 1);
    }
    long odds = freq.values().stream().filter(x -> x % 2 == 1).count();
    if (odds > 1) return n - (int) odds + 1;
    return n;
  }
}
