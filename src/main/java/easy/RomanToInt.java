package easy;

import java.util.Map;

public class RomanToInt {

  private static final Map<Character, Integer> romanNumerals =
      Map.of('I', 1, 'V', 5, 'X', 10, 'L', 50, 'C', 100, 'D', 500, 'M', 1000);

  public int toInt(String roman) {
    int total = 0;
    int end = roman.length();

    for (int i = 0; i < end; i++) {
      int currentValue = romanNumerals.get(roman.charAt(i));
      int nextValue = (i < end - 1) ? romanNumerals.get(roman.charAt(i + 1)) : 0;
      if (currentValue < nextValue) {
        total -= currentValue;
      } else {
        total += currentValue;
      }
    }
    return total;
  }

  public int solve(String roman) {
    return this.toInt(roman);
  }
}
