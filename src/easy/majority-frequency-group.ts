export const majorityFrequencyGroup = (s: string): string => {
	const freq: Map<string, number> = new Map();
	const entries: Record<number, string> = {};
	for (const char of s) {
		freq.set(char, (freq.get(char) ?? 0) + 1);
	}
	freq.forEach((count, char) => {
		entries[count] = (entries[count] ?? "").concat(char);
	});
	const groups = Object.entries(entries);

	groups.sort(
		(a, b) => b[1].length - a[1].length || Number(b[0]) - Number(a[0]),
	);
	return groups[0][1];
};
