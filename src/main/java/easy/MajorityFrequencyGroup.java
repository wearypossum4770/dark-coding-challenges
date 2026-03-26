package easy;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class MajorityFrequencyGroup {
  public String solve(String s) {
    HashMap<Character, Integer> freq = new HashMap<>();
    HashMap<Integer, String> entries = new HashMap<>();
    for (char c : s.toCharArray()) {
      freq.compute(c, (k, v) -> v == null ? 1 : v + 1);
    }
    for (Map.Entry<Character, Integer> entry : freq.entrySet()) {
      String c = String.valueOf(entry.getKey());
      entries.compute(entry.getValue(), (k, v) -> v == null ? c : v + c);
    }
    return entries.entrySet().stream()
        .sorted(
            Comparator.<Map.Entry<Integer, String>>comparingInt(e -> e.getValue().length())
                .reversed()
                .thenComparing(
                    Comparator.<Map.Entry<Integer, String>>comparingInt(Map.Entry::getKey)
                        .reversed()))
        .toList()
        .get(0)
        .getValue();
  }
}
