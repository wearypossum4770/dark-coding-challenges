package medium;

import java.util.Arrays;

public class MaximumGap {
  public int solve(int[] nums) {
    if (nums.length < 2) return 0;
    Arrays.sort(nums);
    int result = nums[1] - nums[0];
    for (int i = 0; i < nums.length - 1; i++) {
      result = Math.max(result, nums[i + 1] - nums[i]);
    }
    return result;
  }
}
