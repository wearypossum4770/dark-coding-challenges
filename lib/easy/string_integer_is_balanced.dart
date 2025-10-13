bool stringIntegerIsBalanced(String number) {
  int even = 0;
  int odd = 0;
  for (int i = 0; i < number.length; i++) {
    int n = int.parse(number[i]);
    if (i % 2 == 0) {
      even += n;
    } else {
      odd += n;
    }
  }
  return even == odd;
}
