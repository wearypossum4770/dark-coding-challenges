package medium;

import java.util.Arrays;
import java.util.HashMap;

public class MinSubArray {
  public int solve(int[] nums, int p) {
    int total = (int) (Arrays.stream(nums).asLongStream().sum() % p);

    if (total == 0) return 0;

    int result = nums.length;
    int prefix = 0;

    HashMap<Integer, Integer> map = new HashMap<>();
    map.put(0, -1);

    for (int i = 0; i < nums.length; i++) {
      prefix = (prefix + nums[i]) % p;
      Integer target = map.get((prefix - total + p) % p);
      if (target != null) {
        result = Math.min(result, i - target);
      }
      map.put(prefix, i);
    }
    return result == nums.length ? -1 : result;
  }
}
