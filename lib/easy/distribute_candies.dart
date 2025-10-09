int distributeCandies(List<int> candyType) {
  int stop = candyType.length ~/ 2;
  Set<int> unique = {};
  for (int candy in candyType) {
    if (unique.length < stop) {
      unique.add(candy);
    } else {
      return stop;
    }
  }
  return unique.length;
}
