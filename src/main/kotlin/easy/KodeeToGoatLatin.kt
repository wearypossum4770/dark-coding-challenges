package easy;
val vowels = setOf('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
fun kodeeToGoatLatin(sentence: String): String  {
	var result = StringBuilder()
	val words = sentence.split(" ")
	for (i in words.indices) {
		val word = words[i]
		val suffix = "a".repeat(i + 1)
		if(word[0] in vowels) {
			result.append(word + "ma" + suffix + " ")
		}else {
                result.append("${word.substring(1)}${word[0]}ma$suffix ")

		}
	}
	
	return result.toString().trim()
}