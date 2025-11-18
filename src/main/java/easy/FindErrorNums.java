package easy;

public class FindErrorNums {
  public int[] solve(int[] nums) {
    int[] result = new int[nums.length];
    int[] target = new int[] {0, 0};
    for (int i : nums) {
      if (result[i - 1] > 0) {
        target[0] = i;
      } else {
        result[i - 1] = i;
      }
    }
    for (int i = 0; i < result.length; i++) {
      if (result[i] == 0) {
        target[1] = i + 1;
      }
    }
    return target;
  }
}
