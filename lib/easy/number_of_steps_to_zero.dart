int numberOfStepsToZero(int n) {
  if (n < 0) return 0;
  int steps = 0;
  while (n > 0) {
    if (n % 2 == 0) {
      n ~/= 2;
    } else {
      n--;
    }
    steps++;
  }

  return steps;
}
