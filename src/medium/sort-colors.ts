export const sortColors = (nums: number[]): void => {
	const freq = new Map<number, number>();
	for (const num of nums) {
		freq.set(num, (freq.get(num) ?? 0) + 1);
	}
	let left = 0;
	for (let i = 0; i < 3; i++) {
		let count = freq.get(i) ?? 0;
		while (count-- > 0) {
			nums[left++] = i;
		}
	}
};
