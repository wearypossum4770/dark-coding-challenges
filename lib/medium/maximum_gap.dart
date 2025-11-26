import "dart:math";

int maximumGap(List<int> nums) {
  if (nums.length < 2) return 0;
  nums.sort((a, b) => a.compareTo(b));

  int result = nums[1] - nums[0];
  for (int i = 1; i < nums.length - 1; i++) {
    result = max(result, nums[i + 1] - nums[i]);
  }
  return result;
}
