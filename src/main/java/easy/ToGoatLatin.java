package easy;

import java.util.regex.Pattern;

public class ToGoatLatin {
	final Pattern vowels = Pattern.compile("^[aeiou]", Pattern.CASE_INSENSITIVE);
public String solve(String sentence) {
	StringBuilder result = new StringBuilder();
	String[] words = sentence.split(" ");
	for (int i = 0; i < words.length; i++) {
		String word = words[i];
		String suffix = "a".repeat(i + 1);
		if (vowels.matcher(word).find()) {
			result.append(word).append("ma").append(suffix).append(" ");
		}else {
	result.append(word.substring(1)).append(word.charAt(0)).append("ma").append(suffix).append(" ");
			

		}
	}

	return result.toString().trim();
}}