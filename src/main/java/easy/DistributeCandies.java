package easy;

import java.util.HashSet;
import java.util.Set;

public class DistributeCandies {
  public int solve(int[] candyType) {
    Set<Integer> unique = new HashSet<>();
    for (Integer candy : candyType) {
      unique.add(candy);
    }

    return Math.min(unique.size(), candyType.length / 2);
  }
}
