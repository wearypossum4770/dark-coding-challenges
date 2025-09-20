package easy;

public class StringIsSubsequence {
  public boolean solve(String s, String t) {
    int left = 0;
    int right = 0;
    if (s.length() > t.length()) return false;
    while (left < s.length() && right < t.length()) {
      if (s.charAt(left) == t.charAt(right)) {
        left++;
      }
      right++;
    }

    return left == s.length();
  }
}
