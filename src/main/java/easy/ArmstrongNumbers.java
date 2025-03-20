package easy;

public class ArmstrongNumbers {
  public int isArmstrongNumber(int input) {
    if (input < 0) return 0;
    int total = 0;
    int index = 0;
    String target = Integer.toString(input);
    int end = target.length();
    while (index < end) {
      int base = target.charAt(index) - '0';
      total += Math.pow(base, end);
      index += 1;
    }
    return total == input ? 1 : 0;
  }

  public int solve(int input) {
    return this.isArmstrongNumber(input);
  }
}
