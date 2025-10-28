package easy;

public class ReverseVowels {
  public boolean isVowel(char c) {
    return switch (Character.toLowerCase(c)) {
      case 'a', 'e', 'i', 'o', 'u' -> true;
      default -> false;
    };
  }

  public String solve(String s) {
    char[] result = new char[s.length()];
    int left = 0, right = result.length - 1;
    while (left <= right) {

      if (!isVowel(s.charAt(left))) {
        result[left] = s.charAt(left);
        left++;
      } else if (!isVowel(s.charAt(right))) {
        result[right] = s.charAt(right);
        right--;
      } else {
        result[right] = s.charAt(left);
        result[left] = s.charAt(right);
        right--;
        left++;
      }
    }
    return new String(result);
  }
}
