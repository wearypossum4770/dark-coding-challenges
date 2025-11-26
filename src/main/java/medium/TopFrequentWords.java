package medium;

import java.util.HashMap;
import java.util.List;

public class TopFrequentWords {
  public List<String> solve(String[] words, int k) {
    HashMap<String, Integer> freq = new HashMap<>();
    for (String word : words) {
      freq.put(word, freq.getOrDefault(word, 0) + 1);
    }
    return freq.entrySet().stream()
        .sorted(
            (a, b) -> {
              int f = a.getValue(), g = b.getValue();
              if (f != g) return g - f;
              return a.getKey().compareTo(b.getKey());
            })
        .map((entry) -> entry.getKey())
        .limit(k)
        .toList();
  }
}
