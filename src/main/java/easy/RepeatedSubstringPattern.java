package easy;

public class RepeatedSubstringPattern {
  public boolean solve(String s) {
    if (s.isEmpty()) return true;
    return s.repeat(2).substring(1, s.length() * 2 - 1).contains(s);
  }
}
