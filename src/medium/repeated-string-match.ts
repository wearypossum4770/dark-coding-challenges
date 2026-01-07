export const repeatedStringMatch = (a: string, b: string): number => {
	let repeated = a;
	let count = 1;
	while (repeated.length < b.length) {
		count++;
		repeated += a;
	}
	if (repeated.includes(b)) return count;
	repeated += a;
	if (repeated.includes(b)) return count + 1;
	return -1;
};
