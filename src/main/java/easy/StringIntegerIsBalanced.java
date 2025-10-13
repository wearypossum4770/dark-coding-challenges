package easy;

public class StringIntegerIsBalanced {
  public boolean solve(String num) {
    int even = 0;
    int odd = 0;
    for (int i = 0; i < num.length(); i++) {
      if (i % 2 == 0) {
        even += Character.getNumericValue(num.charAt(i));
      } else {
        odd += Character.getNumericValue(num.charAt(i));
      }
    }
    return even == odd;
  }
}
