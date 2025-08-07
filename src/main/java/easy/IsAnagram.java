package easy;

import java.util.HashMap;

public class IsAnagram {
  public boolean solve(String s, String t) {
    HashMap<Character, Integer> cache = new HashMap<>();
    for (Character c : s.toCharArray()) {
      cache.put(c, cache.getOrDefault(c, 0) + 1);
    }
    for (Character c : t.toCharArray()) {
      int count = cache.getOrDefault(c, 0);
      if (count < 1) {
        return false;
      } else {
        cache.put(c, count - 1);
      }
    }
    for (Integer i : cache.values()) {
      if (i != 0) return false;
    }
    return true;
  }
}
