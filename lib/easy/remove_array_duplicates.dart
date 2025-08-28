int removeArrayDuplicates(List<int> nums) {
  if (nums.length <= 1) return 0;
  int count = 0;

  for (final val in nums) {
    if (val != nums[count]) {
      count++;
      nums[count] = val;
    }
  }
  return count + 1;
}
