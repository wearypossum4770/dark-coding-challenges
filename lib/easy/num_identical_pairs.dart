int numIdenticalPairs(List<int> nums) {
  int count = 0;
  int left = 0;
  while (left < nums.length) {
    int right = left + 1;
    while (right < nums.length) {
      if (nums[left] == nums[right]) {
        count++;
      }
      right++;
    }
    left++;
  }
  return count;
}
