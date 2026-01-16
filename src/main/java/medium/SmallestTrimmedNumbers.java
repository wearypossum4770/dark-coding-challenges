package medium;

import java.util.Arrays;
import java.util.Comparator;

record DukeRank(int index, String value) {}

public class SmallestTrimmedNumbers {
  public int[] solve(String[] nums, int[][] queries) {
    int[] result = new int[queries.length];
    for (int i = 0; i < queries.length; i++) {
      int rank = queries[i][0];
      int digit = queries[i][1];
      DukeRank[] trimmed = new DukeRank[nums.length];
      for (int j = 0; j < nums.length; j++) {
        String num = nums[j];
        int start = Math.max(0, num.length() - digit);
        trimmed[j] = new DukeRank(j, num.substring(start));
      }
      Arrays.sort(trimmed, Comparator.comparing(DukeRank::value).thenComparingInt(DukeRank::index));
      result[i] = trimmed[rank - 1].index();
    }
    return result;
  }
}
