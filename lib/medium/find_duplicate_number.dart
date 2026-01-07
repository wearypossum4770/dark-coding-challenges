int findDuplicateNumber(List<int> nums) {
  List<int> result = List.filled(nums.length, 0);
  for (int n in nums) {
    if (result[n - 1] > 0) return n;
    result[n - 1]++;
  }

  return 0;
}
