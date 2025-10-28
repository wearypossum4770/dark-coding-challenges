package easy;

public class FindFirstPalindrome {
  public boolean check(String word) {
    int left = 0;
    int right = word.length() - 1;
    while (left < right) {
      if (word.charAt(right) != word.charAt(left)) return false;
      left++;
      right--;
    }

    return true;
  }

  public String solve(String[] words) {
    for (String word : words) {
      if (check(word)) return word;
    }
    return "";
  }
}
