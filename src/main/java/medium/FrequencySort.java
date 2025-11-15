package medium;

import helpers.AlphanumericCleaner;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class FrequencySort {

  public String optimized(String s) {
    String[] result = new String[s.length()];
    Arrays.fill(result, "");
    int index = 0;
    int[] freq = new int[52];
    for (char c : s.toCharArray()) {
      freq[AlphanumericCleaner.caseSensitiveAlphaNumIndex(c)]++;
    }
    for (int i = 0; i < freq.length; i++) {
      if (freq[i] != 0) {
        result[index++] = AlphanumericCleaner.indexToCaseSensitiveAlphaNum(i).repeat(freq[i]);
      }
    }
    return Arrays.stream(result)
        .sorted((a, b) -> Integer.compare(b.length(), a.length()))
        .collect(Collectors.joining());
  }

  public String solve(String s) {
    StringBuilder sb = new StringBuilder();
    HashMap<Character, Integer> freq = new HashMap<>();
    for (char c : s.toCharArray()) {
      freq.put(c, freq.getOrDefault(c, 0) + 1);
    }
    Map<Character, Integer> sorted =
        freq.entrySet().stream()
            .sorted(Map.Entry.<Character, Integer>comparingByValue().reversed())
            .collect(
                Collectors.toMap(
                    Map.Entry::getKey, Map.Entry::getValue, (a, b) -> a, LinkedHashMap::new));
    for (Map.Entry<Character, Integer> ch : sorted.entrySet()) {
      sb.append(String.valueOf(ch.getKey()).repeat(ch.getValue()));
    }
    return sb.toString();
  }
}

/**
 * Question 1. Tell me about a time when you went above and beyond your expected tasks while working
 * on a project.
 *
 * <p>Answer 1. In my previous role, I developed and maintained React applications that enhanced
 * video experience delivery, which boosted user engagement by 23% and improved service requests for
 * over 500,000 monthly users. I also established CI/CD pipelines using GitHub Actions and Jenkins,
 * reducing deployment time by 17%. This not only ensured efficient updates to video platform
 * services but also contributed to the overall reliability of our systems.
 *
 * <p>Question 2. How do you approach collaboration with product managers and other engineering
 * teams?
 *
 * <p>Question 3. Can you describe your experience with algorithms and data structures in your
 * previous projects?
 *
 * <p>Question 4. What has been your experience with CI/CD practices, and how have they impacted
 * your development process?
 *
 * <p>Question 5. Have you worked with video delivery systems or similar technologies? If so, can
 * you share an example?
 */
