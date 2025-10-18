package easy;

import java.util.Arrays;

public class FindEvenDigitNumbers {
  public int solve(int[] nums) {
    return (int) Arrays.stream(nums).filter(num -> String.valueOf(num).length() % 2 == 0).count();
  }
}
