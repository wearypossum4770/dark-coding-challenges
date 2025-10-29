List<int> sortArrayByParity(List<int> nums) {
  List<int> result = List.filled(nums.length, 0);
  int even = 0;
  int odd = nums.length - 1;
  for (int n in nums) {
    if (n % 2 == 0) {
      result[even] = n;
      even++;
    } else {
      result[odd] = n;
      odd--;
    }
  }
  return result;
}
