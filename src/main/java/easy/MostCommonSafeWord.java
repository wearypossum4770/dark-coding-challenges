package easy;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class MostCommonSafeWord {
  public String solve(String paragraph, String[] banned) {
    List<String> bannedStream = Arrays.asList(banned);
    HashMap<String, Integer> freq = new HashMap<>();
    String[] words = paragraph.toLowerCase().split("[!?'.,;\\s]+");
    for (String word : words) {
      if (!bannedStream.contains(word)) {
        freq.put(word, freq.getOrDefault(word, 0) + 1);
      }
    }

    return freq.entrySet().stream()
        .max((a, b) -> a.getValue() - b.getValue())
        .map(entry -> entry.getKey())
        .orElse("");
  }
}
