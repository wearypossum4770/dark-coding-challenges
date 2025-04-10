package easy;

import java.util.Optional;

public class RemoveElement {
  public int removeElement(int[] nums, int val) {
    int result = 0;
    for (Integer i: nums) {
      if (!i.equals(val)) {
        nums[result] = i;
        result++;
      }
    }
    return result;
  }
  public int removeOptionalElement(Optional<Integer>[] nums, Integer val) {
    int result = 0;
    Optional<Integer> value = Optional.of(val);
    for (int index = 0; index < nums.length; index++) {
      if (!nums[index].equals(value)) {
        result++;
      } else {
        nums[index] = Optional.empty();
      }
    }
    return result;
  }
}
