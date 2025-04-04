package easy;

public class ReverseString {
  public void solve(char[] s) {
    int left = 0, right = s.length - 1;
    char temp;
    while (left < right) {
      temp = s[left];
      s[left] = s[right];
      s[right] = temp;
      left++;
      right--;
    }
  }
}
