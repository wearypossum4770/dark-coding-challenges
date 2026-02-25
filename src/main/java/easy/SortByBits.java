package easy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SortByBits {
  public int[] solve(int[] arr) {
    HashMap<Integer, List<Integer>> freq = new HashMap<>();
    for (int num : arr) {
      int count = 0;
      String binary = Integer.toBinaryString(num);
      for (char c : binary.toCharArray()) {
        if (c == '1') count++;
      }
      List<Integer> nums = freq.computeIfAbsent(count, k -> new ArrayList<>());
      nums.add(num);
    }
    for (List<Integer> values : freq.values()) {
      values.sort(null);
    }
    List<Map.Entry<Integer, List<Integer>>> entries = new ArrayList<>(freq.entrySet());
    entries.sort(Map.Entry.comparingByKey());
    return entries.stream()
        .flatMap(e -> e.getValue().stream())
        .mapToInt(Integer::intValue)
        .toArray();
  }
}
