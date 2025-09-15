List<int> runningArraySum(List<int> nums) {
  List<int> result = List.filled(nums.length, 0);
  for (int i = 0; i < nums.length; i++) {
    if (i == 0) {
      result[i] = nums[i];
    } else {
      result[i] = result[i - 1] + nums[i];
    }
  }
  return result;
}
