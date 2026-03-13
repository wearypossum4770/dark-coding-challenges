package easy;

import java.util.Arrays;

public class FindLargestAltitude {
  public int solve(int[] gain) {
    int altitude = 0;
    int[] result = new int[gain.length + 1];
    for (int i = 0; i < gain.length; i++) {
      result[i] = gain[i] + altitude;
      altitude += gain[i];
    }
    return Arrays.stream(result).max().getAsInt();
  }
}
