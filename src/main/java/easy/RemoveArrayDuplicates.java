package easy;

import java.util.ArrayList;
import java.util.Objects;

public class RemoveArrayDuplicates {
  public int removeDuplicates(ArrayList<Integer> a) {
    int count = 0;
    if (a.size() < 2) return a.size();
    for (Integer i : a) {
      if (!i.equals(a.get(count))) {
        count++;
        a.set(count, i);
      }
    }
    return count + 1;
  }

  public int solve(int[] nums) {
    int count = 0;
    if (nums.length < 2) return nums.length;
    for (int n : nums) {
      if (!Objects.equals(n, nums[count])) {
        count++;
        nums[count] = n;
      }
    }
    return count + 1;
  }
}
