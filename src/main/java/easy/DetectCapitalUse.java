package easy;

public class DetectCapitalUse {
  public boolean solve(String word) {
    int uppercase = 1;
    int lowercase = 1;
    if (Character.isLowerCase(word.charAt(0))) return word == word.toLowerCase();

    for (Character c : word.substring(1).toCharArray()) {
      if (Character.isUpperCase(c)) uppercase++;
      else if (Character.isLowerCase(c)) lowercase++;
    }
    return word.length() == uppercase || word.length() == lowercase;
  }
}
