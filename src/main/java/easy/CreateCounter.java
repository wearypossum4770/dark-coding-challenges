package easy;

import java.util.Arrays;
import java.util.function.Supplier;

public class CreateCounter {
  public static String[] stringArrayOf(String value, int size) {
    String[] result = new String[size];
    Arrays.fill(result, value);
    return result;
  }

  public static int[] intArrayFromRange(int size, int initial) {
    int[] result = new int[size];
    for (int i = 0; i < result.length; i++) {
      result[i] = initial + i;
    }
    return result;
  }

  public static void closureCapture(int[] nums, int index, Supplier<Integer> counter) {
    nums[index] = counter.get();
  }

  public static Supplier<Integer> createCounter(int n) {
    final int[] count = {n};
    return () -> {
      int current = count[0];
      count[0]++;
      return current;
    };
  }
}
