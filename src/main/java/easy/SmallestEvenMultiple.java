package easy;

public class SmallestEvenMultiple {
  public int solve(int n) {
    if (n % 2 != 0) return n * 2;
    return n;
  }
}
