export const reverseWordPrefix = (word: string, ch: string): string => {
	for (let i = 0; i < word.length; i++) {
		if (word[i] === ch) {
			const result = word.split("");
			return (
				result
					.slice(0, i + 1)
					.reverse()
					.join("") + result.slice(i + 1).join("")
			);
		}
	}
	return word;
};
