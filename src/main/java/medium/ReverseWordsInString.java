package medium;

public class ReverseWordsInString {
  public String solve(String s) {
    StringBuilder sb = new StringBuilder();
    String[] words = s.trim().split("\\s+");
    int right = words.length - 1;
    while (right >= 0) {
      String word = words[right];
      if (!word.isBlank() || !word.isEmpty() || !word.equals(" ")) {
        sb.append(word).append(" ");
      }
      right--;
    }
    return sb.toString().trim();
  }
}
