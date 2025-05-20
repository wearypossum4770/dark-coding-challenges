package easy;

import java.util.ArrayList;
import java.util.List;

public class FizzBuzz {

  public String parseInteger(int candidate) {
    if (candidate % 15 == 0) return "FizzBuzz";
    if (candidate % 5 == 0) return "Buzz";
    if (candidate % 3 == 0) return "Fizz";
    return Integer.toString(candidate);
  }

  public List<String> fizzBuzz(int candidate) {
    List<String> target = new ArrayList<>(candidate);
    for (int position = 0; position < candidate; position++) {
      target.add(this.parseInteger(position + 1));
    }
    return target;
  }

  public List<String> solve(int candidate) {
    return this.fizzBuzz(candidate);
  }
}
