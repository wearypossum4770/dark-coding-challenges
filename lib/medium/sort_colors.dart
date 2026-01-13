void sortColors(List<int> nums) {
  Map<int, int> freq = {};
  for (int i in nums) {
    freq[i] = (freq[i] ?? 0) + 1;
  }
  int index = 0;
  for (int i = 0; i < 3; i++) {
    int count = freq[i] ?? 0;
    while (count-- > 0) {
      nums[index++] = i;
    }
  }
}
