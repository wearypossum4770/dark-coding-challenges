import 'dart:math';

int minSubArray(List<int> nums, int p) {
  int total = nums.reduce((a, b) => a + b) % p;
  if (total == 0) return 0;
  int result = nums.length;
  int prefix = 0;
  Map<int, int> map = {0: -1};
  for (int i = 0; i < nums.length; i++) {
    prefix = (prefix + nums[i]) % p;
    int? value = map[(prefix - total + p) % p];
    if (value != null) {
      result = min(result, i - value);
    }
    map[prefix] = i;
  }
  return result == nums.length ? -1 : result;
}
