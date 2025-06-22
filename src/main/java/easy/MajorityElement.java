package easy;

import java.util.HashMap;
import java.util.Map;

public class MajorityElement {
  public int solve(int[] nums) {
    int half = nums.length / 2;
    HashMap<Integer, Integer> freq = new HashMap<>();
    for (Integer i : nums) {
      freq.compute(i, (k, v) -> (v == null ? 1 : v + 1));
    }
    for (Map.Entry<Integer, Integer> entry : freq.entrySet()) {
      if (entry.getValue() > half) {
        return entry.getKey();
      }
    }
    return 0;
  }
}
