package easy;

public class ReverseWordPrefix {
  public String solve(String word, char ch) {
    for (int i = 0; i < word.length(); i++) {
      if (word.charAt(i) == ch) {
        char[] result = new char[word.length()];
        int position = 0;
        int left = i;
        int right = i + 1;
        while (left >= 0) {
          result[position++] = word.charAt(left--);
        }
        while (right < word.length()) {
          result[position++] = word.charAt(right++);
        }
        return new String(result);
      }
    }
    return word;
  }
}
