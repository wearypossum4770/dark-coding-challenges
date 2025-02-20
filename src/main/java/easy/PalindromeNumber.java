package easy;

public class PalindromeNumber {
  public Boolean solve(int x) {
    return this.isNumberPalindromic(x);
  }

  public Boolean isNumberPalindromic(int x) {
    if (x < 0 || (x % 10 == 0 && x != 0)) {
      return false;
    }

    String number = Integer.toString(x);
    int left = 0, right = number.length() - 1;
    while (left < right) {
      if (number.charAt(left) != number.charAt(right)) {
        return false;
      }
      right--;
      left++;
    }
    return true;
  }
}
