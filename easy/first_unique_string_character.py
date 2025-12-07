def first_unique_string_character(s: str) -> int:
	freq = [0] * 26
	for char in s:
		freq[ord(char) - ord('a')] += 1
	for i, char in enumerate(s):
		if freq[ord(char) - ord('a')] == 1:
			return i
	return -1