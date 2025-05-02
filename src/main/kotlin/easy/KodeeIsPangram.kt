package easy

fun kodeeIsPangram(input: String): Boolean = ('a'..'z').all { it in input.lowercase() }
