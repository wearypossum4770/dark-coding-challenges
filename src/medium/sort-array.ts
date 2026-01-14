export const sortArray = (nums: number[]): number[] => {
	const flat = nums.flat(Infinity);
	if (flat.length === 0) return [];
	const freq = new Map<number, number>();
	const result = new Array<number>(flat.length);
	let max = flat[0];
	let min = flat[0];
	let index = 0;
	for (const num of flat) {
		freq.set(num, (freq.get(num) ?? 0) + 1);
		if (num > max) max = num;
		if (num < min) min = num;
	}
	for (let i = min; i <= max; i++) {
		let count = freq.get(i) ?? 0;
		while (count > 0) {
			count--;
			result[index++] = i;
		}
	}
	return result;
};
