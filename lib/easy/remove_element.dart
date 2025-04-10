int removeElement(List<int> nums, int val) {
  int result = 0;
  for (final i in nums) {
    if (i != val) {
      nums[result] = i;
      result += 1;
    }
  }

  return result;
}
