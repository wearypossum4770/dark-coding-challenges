int findEvenDigitNumbers(List<int> nums) {
  int result = 0;
  for (int n in nums) {
    if (n.toString().length % 2 == 0) {
      result += 1;
    }
  }

  return result;
}
