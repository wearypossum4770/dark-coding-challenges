package easy;

public class SortArrayByParityTwo {
  public int[] solve(int[] nums) {
    int[] result = new int[nums.length];
    int even = 0;
    int odd = 1;
    for (int n : nums) {
      if (n % 2 == 0) {
        result[even] = n;
        even += 2;
      } else {
        result[odd] = n;
        odd += 2;
      }
    }
    return result;
  }
}
