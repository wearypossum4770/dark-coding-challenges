package easy;

public class CheckPerfectNumber {
  public boolean checkPerfectNumber(long n) {
    return n == this.calculatePerfectNumber(n);
  }

  public String classifyPerfectNumber(long n) {
    long num = this.calculatePerfectNumber(n);
    if (n < num) return "abundant";
    if (n > num) return "deficient";
    return "perfect";
  }

  public long calculatePerfectNumber(long n) {
    if (n <= 0) {
      throw new IllegalArgumentException("A perfect number must be 1 or greater.");
    }
    if (n == 1) return 1;
    long root = (long) Math.sqrt(n);
    long total = 1;
    for (long i = 2; i <= root; i++) {
      if (n % i == 0) {
        total += i;
        long other = (long) (n / i);
        if (other != i) {
          total += other;
        }
      }
    }
    return total;
  }
}
