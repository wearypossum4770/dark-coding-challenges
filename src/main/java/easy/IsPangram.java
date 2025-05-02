package easy;

import java.util.HashSet;
import java.util.Set;

public class IsPangram {

  public boolean checkPangram(String sentence) {
    if (sentence == null) return false;
    Set<Character> letters = new HashSet<>();

    for (char c : sentence.toLowerCase().toCharArray()) {
      if (c >= 'a' && c <= 'z') {
        letters.add(c);
      }
      if (letters.size() == 26) return true;
    }
    return letters.size() == 26;
  }

  public boolean solve(String sentence) {
    return this.checkPangram(sentence);
  }
}
