package medium;

import java.util.HashMap;

public class SortColors {
  public void solve(int[] nums) {
    HashMap<Integer, Integer> freq = new HashMap<>();
    for (int i : nums) {
      freq.put(i, freq.getOrDefault(i, 0) + 1);
    }
    int index = 0;
    for (int i = 0; i < 3; i++) {
      int count = freq.getOrDefault(i, 0);
      while (count-- > 0) {
        nums[index++] = i;
      }
    }
  }
}
