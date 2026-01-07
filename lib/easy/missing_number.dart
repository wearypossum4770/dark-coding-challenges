int missingNumber(List<int> nums) {
  int expected = nums.length * (nums.length + 1) ~/ 2;
  return expected - nums.reduce((a, c) => a + c);
}
