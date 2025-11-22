package medium;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TopFrequentElements {
  public int[] solve(int[] nums, int k) {
    int[] result = new int[k];
    HashMap<Integer, Integer> freq = new HashMap<>();
    for (int i : nums) {
      freq.put(i, freq.getOrDefault(i, 0) + 1);
    }
    List<Map.Entry<Integer, Integer>> sorted =
        freq.entrySet().stream().sorted((a, b) -> b.getValue() - a.getValue()).toList();
    System.err.println(sorted);

    for (int i = 0; i < result.length; i++) {
      result[i] = sorted.get(i).getKey();
    }
    return result;
  }
}
