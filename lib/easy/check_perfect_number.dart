import 'dart:math';

bool checkPerfectNumber(int n) {
  if (n <= 0) throw Exception("Classification is only possible for natural numbers");
  if (n == 1) return false;
  return n == calculatePerfectNumber(n);
}

String classifyPerfectNumber(int n) {
  int val = calculatePerfectNumber(n);
  if (n < val) return "abundant";
  if (n > val) return "deficient";
  return "perfect";
}

int calculatePerfectNumber(int n) {
  int total = 1;

  int root = sqrt(n.toDouble()).toInt();
  for (int i = 2; i <= root; i++) {
    if (n % i == 0) {
      total += i;
      int factor = n ~/ i;
      if (factor != i) {
        total += factor;
      }
    }
  }
  return total;
}
