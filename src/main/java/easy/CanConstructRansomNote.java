package easy;

public class CanConstructRansomNote {
  public boolean solve(String ransomNote, String magazine) {
    int[] freq = new int[26];
    for (char c : magazine.toLowerCase().toCharArray()) {
      if (c >= 97 && c <= 122) {
        freq[c - 97] += 1;
      }
    }
    for (char c : ransomNote.toLowerCase().toCharArray()) {
      if (c >= 97 && c <= 122) {
        freq[c - 97] -= 1;
        if (freq[c - 97] < 0) return false;
      }
    }
    return true;
  }
}
