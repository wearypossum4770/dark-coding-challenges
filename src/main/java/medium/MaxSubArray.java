package medium;

public class MaxSubArray {
  public int solve(int[] nums) {
    int result = nums[0];
    int ending = nums[0];
    for (int i = 1; i < nums.length; i++) {
      ending = Math.max(ending + nums[i], nums[i]);
      result = Math.max(result, ending);
    }

    return result;
  }
}
