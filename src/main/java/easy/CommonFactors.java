package easy;

public class CommonFactors {
  public int solve(int a, int b) {
    int count = 0;
    int max = a > b ? a : b;
    for (int i = 1; i < max + 1; i++) {
      if (a % i == 0 && b % i == 0) {
        count++;
      }
    }
    return count;
  }
}
