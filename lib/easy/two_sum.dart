List<int> twoSum(List<int> nums, int target) {
  var seen = <int, int>{};
  int index = 0;
  for (int num in nums) {
    int complement = target - num;
    if (seen.containsKey(complement)) {
      return [seen[complement] ?? 0, index];
    }
    seen[num] = index;
    index += 1;
  }
  return [];
}
