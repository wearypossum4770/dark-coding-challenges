int reverseInteger(int x) {
  int result = 0;
  int y = x.abs();
  int s = 1;
  if (x < 0) s *= -1;
  while (y != 0) {
    result = result * 10 + (y % 10);
    y ~/= 10;
  }

  if (result > 0x7FFFFFFF || result < -0x80000000) {
    return 0;
  }
  return result * s;
}
