package easy;

public class NumOfUnplacedFruits {
  public int solve(int[] fruits, int[] baskets) {
    int count = fruits.length;
    boolean[] replaced = new boolean[baskets.length];
    for (int fruit : fruits) {
      int right = 0;
      while (right < baskets.length) {
        if (baskets[right] >= fruit && !replaced[right]) {
          replaced[right] = true;
          count--;
          break;
        }
        right++;
      }
    }
    return count;
  }
}
