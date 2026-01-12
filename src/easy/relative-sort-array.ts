export const relativeSortArray = (arr1: number[], arr2: number[]): number[] => {
	const result = Array(arr1.length);
	let index = 0;
	const freq = new Map<number, number>();
	for (const num of arr1) {
		freq.set(num, (freq.get(num) ?? 0) + 1);
	}
	for (let i = 0; i < arr2.length; i++) {
		let count = freq.get(arr2[i]) ?? 0;
		while (count > 0) {
			result[index++] = arr2[i];
			count--;
		}
		if (count === 0) {
			freq.delete(arr2[i]);
		}
	}
	const remaining = [...freq.entries()].sort((a, b) => a[0] - b[0]);
	for (let [key, count] of remaining) {
		while (count > 0) {
			result[index++] = key;
			count--;
		}
	}
	return result;
};
