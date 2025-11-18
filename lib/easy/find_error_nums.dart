List<int> findErrorNums(List<int> nums) {
  List<int> result = List.filled(nums.length, 0);
  List<int> target = [0, 0];
  for (int n in nums) {
    if (result[n - 1] > 0) {
      target[0] = n;
    } else {
      result[n - 1] = n;
    }
  }
  for (int i = 0; i < result.length; i++) {
    if (result[i] == 0) {
      target[1] = i + 1;
      return target;
    }
  }
  return target;
}
