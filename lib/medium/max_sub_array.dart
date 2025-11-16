import "dart:math";

int maxSubArray(List<int> nums) {
  int result = nums[0];
  int ending = nums[0];
  for (int i = 1; i < nums.length; i++) {
    ending = max(ending + nums[i], nums[i]);
    result = max(result, ending);
  }
  return result;
}
