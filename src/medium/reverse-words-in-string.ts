export const reverseWordsInString = (s: string): string => {
	const words = s.trim().split(/\s+/g);
	words.reverse();
	return words.join(" ");
};

console.log(reverseWordsInString("  spaces   between   words  "));
