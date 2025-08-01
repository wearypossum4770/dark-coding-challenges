package easy;

import java.util.HashSet;

public class FindMissingAndRepeatedValues {
  public int[] solve(int[][] grid) {
    HashSet<Integer> counts = new HashSet<>();
    int square = grid.length * grid.length;

    int expected = square * (square + 1) / 2;
    int repeated = 0;
    for (int[] row : grid) {
      for (int cell : row) {
        if (counts.contains(cell)) {
          repeated = cell;
        } else {
          counts.add(cell);
          expected -= cell;
        }
      }
    }
    return new int[] {repeated, expected};
  }
}
