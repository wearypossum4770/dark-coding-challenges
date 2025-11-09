package easy;

public class LongestCommonPrefix {
  public String solve(String[] strs) {
    if (strs.length == 0 || strs[0].length() == 0) return "";
    int index = 0;
    outer:
    while (index < strs[0].length()) {
      for (String word : strs) {
        if (index >= word.length() || word.charAt(index) != strs[0].charAt(index)) break outer;
      }
      index++;
    }
    return strs[0].substring(0, index);
  }
}
