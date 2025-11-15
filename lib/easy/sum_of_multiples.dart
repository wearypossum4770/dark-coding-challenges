int sumOfMultiples(int n) {
  int total = 0;
  for (int i = 1; i < n + 1; i++) {
    if (i % 3 == 0 || i % 5 == 0 || i % 7 == 0) {
      total += i;
    }
  }
  return total;
}

List<int> arrayOfMultiples(int factor, int size) {
  List<int> multiples = List.filled(size, factor);
  for (int i = 0; i < size; i++) {
    multiples[i] = (i + 1) * factor;
  }
  return multiples;
}
