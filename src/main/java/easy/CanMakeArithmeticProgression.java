package easy;

import java.util.Arrays;

public class CanMakeArithmeticProgression {
  public boolean solve(int[] arr) {
    Arrays.sort(arr);
    int index = 0;
    int distance = arr[0] - arr[1];
    while (index < arr.length - 1) {
      if (arr[index] - arr[index + 1] != distance) return false;
      index++;
    }
    return true;
  }
}
