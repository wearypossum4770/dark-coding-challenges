package easy;

public class SmallerNumbersThanCurrent {
  public int[] solve(int[] nums) {
    int[] result = new int[nums.length];
    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums.length; j++) {
        if (nums[i] > nums[j]) {
          result[i]++;
        }
      }
    }
    return result;
  }
}
