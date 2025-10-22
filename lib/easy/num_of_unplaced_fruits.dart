int numOfUnplacedFruits(List<int> fruits, List<int> baskets) {
  int count = fruits.length;
  List<bool> replaced = List.filled(baskets.length, false);
  for (final fruit in fruits) {
    for (int i = 0; i < baskets.length; i++) {
      if (baskets[i] >= fruit && !replaced[i]) {
        replaced[i] = true;
        count--;
        break;
      }
    }
  }
  return count;
}
