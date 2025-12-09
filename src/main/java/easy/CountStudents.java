package easy;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class CountStudents {
  public int solve(int[] students, int[] sandwiches) {
    List<Integer> lhs = Arrays.stream(students).boxed().collect(Collectors.toList());
    List<Integer> rhs = Arrays.stream(sandwiches).boxed().collect(Collectors.toList());
    int count = 0;
    while (lhs.size() > 0 && rhs.size() > 0) {
      if (count == lhs.size()) break;
      if (lhs.get(0) != rhs.get(0)) {
        lhs.add(lhs.removeFirst());
        count++;
      } else {
        lhs.removeFirst();
        rhs.removeFirst();
        count = 0;
      }
    }
    return lhs.size();
  }
}
