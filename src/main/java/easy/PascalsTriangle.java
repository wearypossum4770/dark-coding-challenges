package easy;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class PascalsTriangle {
  public List<List<Integer>> solve(int numRows) {
    List<List<Integer>> result = new ArrayList<>();
    if (numRows < 0) return result;
    result.add(List.of(1));
    for (int i = 1; i < numRows; i++) {
      List<Integer> row = IntStream.rangeClosed(0, i).mapToObj(x -> 1).collect(Collectors.toList());
      for (int j = 1; j < i; j++) {
        row.set(j, result.get(i - 1).get(j - 1) + result.get(i - 1).get(j));
      }
      result.add(row);
    }

    return result;
  }
}
