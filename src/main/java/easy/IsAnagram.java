package easy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

  public String[] detectAnagrams(String word, String[] candidates) {
    List<String> valid = new ArrayList<>();
    String lowerWord = word.toLowerCase();
    for (String candidate : candidates) {
      String lowerCandidate = candidate.toLowerCase();
      if (!lowerCandidate.equals(lowerWord) && this.solve(lowerCandidate, lowerWord)) {
        valid.add(candidate);
      }
    }
    return valid.toArray(String[]::new);
  }
}
