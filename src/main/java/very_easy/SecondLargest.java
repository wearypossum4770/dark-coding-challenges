package very_easy;

import java.util.HashSet;

public class SecondLargest {
  public int solve(int[] nums) {
    HashSet<Integer> unique = new HashSet<>();
    int first = Integer.MIN_VALUE;
    int second = first;
    for (int i : nums) {
      unique.add(i);
    }
    for (int i : nums) {
      if (first < i) {
        second = first;
        first = i;
      }
      if (second < i && first > i) {
        second = i;
      }
    }
    return second;
  }
}
