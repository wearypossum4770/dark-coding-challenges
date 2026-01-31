export const nextGreatestLetter = (
	letters: string[],
	target: string,
): string => {
	for (const char of letters) {
		if (target < char) return char;
	}
	return letters[0];
};
