package easy;

import java.util.HashSet;

public class FindArrayDuplicate {
  public int solve(int[] nums) {
    HashSet<Integer> seen = new HashSet<>();
    for (Integer i : nums) {
      if (seen.contains(i)) {
        return i;
      }
      seen.add(i);
    }
    return -1;
  }
}
