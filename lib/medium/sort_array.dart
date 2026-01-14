List<int> sortArray(List<int> nums) {
  if (nums.isEmpty) return [];
  Map<int, int> freq = {};
  List<int> result = List.filled(nums.length, 0);
  int max = nums[0];
  int min = nums[0];
  int index = 0;
  for (int n in nums) {
    freq[n] = (freq[n] ?? 0) + 1;
    if (n > max) max = n;
    if (n < min) min = n;
  }
  for (int i = min; i <= max; i++) {
    int count = freq[i] ?? 0;
    while (count-- > 0) {
      result[index++] = i;
    }
  }
  return result;
}
