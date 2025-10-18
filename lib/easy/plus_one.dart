List<int> plusOne(List<int> digits) {
  List<int> result = digits;
  int index = digits.length - 1;
  int remainder = 1;
  while (index >= 0) {
    int sum = result[index] + remainder;
    if (sum <= 9) {
      result[index] = sum;
      return result;
    }
    result[index] = 0;
    remainder = 1;
    index -= 1;
  }
  if (remainder > 0) {
    result.insert(0, 1);
  }
  return result;
}
