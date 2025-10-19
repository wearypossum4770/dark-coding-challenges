int differenceOfSums(int n, int m) {
  int lhs = 0;
  int rhs = 0;
  for (int i = 1; i < n + 1; i++) {
    if (i % m == 0) {
      rhs += i;
    } else {
      lhs += i;
    }
  }
  return lhs - rhs;
}
