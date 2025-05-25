String toGoatLatin(String sentence) {
  
	List<String> words = sentence.split(" ");
  
	for (int i = 0; i < words.length; i++) {
    
		String suffix = "ma" + "a" * (i + 1);

    if ('aeiouAEIOU'.contains(words[i][0])) {
      words[i] = words[i] + suffix;
    } else {
      words[i] = words[i].substring(1) + words[i][0] + suffix;
    }
  }
  return words.join(" ");
}
