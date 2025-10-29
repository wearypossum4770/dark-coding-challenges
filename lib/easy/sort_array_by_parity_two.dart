List<int> sortArrayByParityTwo(List<int> nums) {
  List<int> result = List.filled(nums.length, 0);
  int even = 0;
  int odd = 1;
  for (int n = 0; n < nums.length; n++) {
    if (nums[n] % 2 == 0) {
      result[even] = nums[n];
      even += 2;
    } else {
      result[odd] = nums[n];
      odd += 2;
    }
  }
  return result;
}
