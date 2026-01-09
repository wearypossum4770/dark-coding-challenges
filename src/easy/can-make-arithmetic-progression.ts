export const canMakeArithmeticProgression = (arr: number[]): boolean => {
	arr.sort((a, b) => a - b);
	const distance = arr[0] - arr[1];
	for (let i = 1; i < arr.length - 1; i++) {
		if (arr[i] - arr[i + 1] !== distance) return false;
	}
	return true;
};
