int arrayPairSum(List<int> nums) {
  int total = 0;
  nums.sort();
  for (int i = 0; i < nums.length - 1; i += 2) {
    total += nums[i];
  }
  return total;
}
