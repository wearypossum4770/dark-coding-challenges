package easy;

public class LicenseKeyFormatting {
  public String solve(String s, int k) {
    String word = s.toUpperCase().replaceAll("-", "");
    if (word.length() < k) return word;
    char[] result = new char[word.length() + (int) Math.floor((word.length() - 1) / k)];
    int count = 0;
    int left = result.length - 1;
    for (int i = word.length() - 1; i >= 0; i--) {
      if (count == k) {
        result[left--] = '-';
        count = 0;
      }
      count++;
      result[left--] = word.charAt(i);
    }
    return String.valueOf(result);
  }
}
