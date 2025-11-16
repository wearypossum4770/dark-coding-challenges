List<int> getArrayConcatenation(List<int> nums) {
  List<int> result = List.filled(2 * nums.length, 0);
  for (int i = 0; i < nums.length; i++) {
    result[i] = nums[i];
    result[i + nums.length] = nums[i];
  }
  return result;
}
