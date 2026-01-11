int maxIceCream(List<int> costs, int coins) {
  int cones = 0;
  costs.sort();
  for (int i in costs) {
    if (coins >= i) {
      cones++;
      coins -= i;
    }
  }
  return cones;
}
