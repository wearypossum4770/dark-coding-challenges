package easy;

import java.util.HashSet;

public class IsBoomerang {
  public boolean solve(int[][] points) {
    HashSet<String> distinct = new HashSet<>();
    for (int[] point : points) {
      String key = String.format("%d,%d", point[0], point[1]);
      if (distinct.contains(key)) return false;
      distinct.add(key);
    }
    int x1 = points[0][0];
    int y1 = points[0][1];
    int x2 = points[1][0];
    int y2 = points[1][1];
    int x3 = points[2][0];
    int y3 = points[2][1];
    return Math.abs(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) != 0;
  }
}
