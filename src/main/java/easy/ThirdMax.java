package easy;

import java.util.Collections;
import java.util.HashSet;

public class ThirdMax {
  public int solve(int[] nums) {
    HashSet<Integer> unique = new HashSet<>();
    for (int n : nums) {
      unique.add(n);
    }
    if (unique.size() < 3) return Collections.max(unique);
    unique.remove(Collections.max(unique));
    unique.remove(Collections.max(unique));
    return Collections.max(unique);
  }
}
