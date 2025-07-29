from collections import Counter

def find_the_difference(s: str, t: str)-> str:
	counts = Counter(s)
	for char in t:
		counts[char] = counts.get(char, 0) - 1
		if counts.get(char, 0) < 0:
			return char
	return ""