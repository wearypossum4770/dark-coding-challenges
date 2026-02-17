package easy;

import java.util.HashSet;

public class ContainsDuplicate {
  public boolean solve(int[] nums) {
    HashSet<Integer> unique = new HashSet<>();
    for (int n : nums) {
      if (unique.contains(n)) return true;
      unique.add(n);
    }
    return false;
  }
}
