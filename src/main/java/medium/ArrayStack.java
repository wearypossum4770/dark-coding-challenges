package medium;

import java.util.ArrayList;
import java.util.List;

public class ArrayStack {
  public List<String> solve(int[] target, int n) {
    List<String> result = new ArrayList<>();
    int counter = 1;
    int index = 0;
    while (index < target.length) {
      result.add("Push");
      if (target[index] == counter) {
        index++;
      } else {
        result.add("Pop");
      }
      counter++;
    }

    return result;
  }
}
