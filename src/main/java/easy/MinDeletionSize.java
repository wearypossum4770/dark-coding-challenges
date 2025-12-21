package easy;

public class MinDeletionSize {
  public int solve(String[] strs) {
    int count = 0;
    int rows = strs.length;
    int cols = strs[0].length();
    for (int col = 0; col < cols; col++) {
      int row = 1;
      while (row < rows) {
        if (strs[row - 1].charAt(col) > strs[row].charAt(col)) {
          count++;
          break;
        }
        row++;
      }
    }
    return count;
  }
}
