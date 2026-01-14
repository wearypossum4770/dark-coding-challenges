package medium;

import java.util.HashMap;

public class SortArray {
  public int[] solve(int[] nums) {
    if (nums.length == 0) return nums;
    HashMap<Integer, Integer> freq = new HashMap<>();
    int[] result = new int[nums.length];
    int max = nums[0];
    int min = nums[0];
    int index = 0;
    for (int i : nums) {
      freq.put(i, freq.getOrDefault(i, 0) + 1);
      if (max < i) max = i;
      if (min > i) min = i;
    }
    for (int i = min; i <= max; i++) {
      int count = freq.getOrDefault(i, 0);
      while (count-- > 0) {
        result[index++] = i;
      }
    }
    return result;
  }
}
