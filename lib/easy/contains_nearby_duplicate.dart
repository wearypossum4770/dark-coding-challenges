bool containsNearbyDuplicate(List<int> nums, int k) {
  Map<int, int> seen = {};
  for (int i = 0; i < nums.length; i++) {
    int? n = seen[nums[i]];
    if (n != null && (i - n).abs() <= k) return true;
    seen[nums[i]] = i;
  }
  return false;
}
