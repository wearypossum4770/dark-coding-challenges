package easy;

import java.util.HashMap;

public class TwoSum {

  public static int[] twoSum(int[] nums, int target) {
    HashMap<Integer, Integer> seen = new HashMap<>();
    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (seen.containsKey(complement)) {
        return new int[] {seen.get(complement), i};
      }
      seen.put(nums[i], i);
    }
    return new int[] {};
  }

  public int[] solve(int[] nums, int target) {
    return twoSum(nums, target);
  }
}
