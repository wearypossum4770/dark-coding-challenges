import "dart:math";

int commonFactors(int a, int b) {
  int count = 0;
  int m = max(a, b);
  for (int i = 1; i < m + 1; i++) {
    if (a % i == 0 && b % i == 0) {
      count++;
    }
  }

  return count;
}
