int majorityElement(List<int> nums) {
  int count = 0;
  int? candidate;

  for (final value in nums) {
    if (count == 0) {
      candidate = value;
    }
    count += (value == candidate) ? 1 : -1;
  }
  return candidate ?? 0;
}
