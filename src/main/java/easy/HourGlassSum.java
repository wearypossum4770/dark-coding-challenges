package easy;

public class HourGlassSum {
  public int solve(int[][] matrix) {
    int max = Integer.MIN_VALUE;

    for (int i = 0; i < matrix.length - 2; i++) {
      for (int j = 0; j < matrix[i].length - 2; j++) {
        int sum =
            matrix[i][j]
                + matrix[i][j + 1]
                + matrix[i][j + 2]
                + matrix[i + 1][j + 1]
                + matrix[i + 2][j]
                + matrix[i + 2][j + 1]
                + matrix[i + 2][j + 2];
        max = Math.max(sum, max);
      }
    }
    return max;
  }
}
