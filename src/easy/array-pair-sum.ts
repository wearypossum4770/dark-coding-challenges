export const arrayPairSum = (nums: number[]): number => {
	let total = 0;
	nums.sort((a, b) => b - a);
	for (let i = 0; i < nums.length - 1; i += 2) {
		total += Math.min(nums[i], nums[i + 1]);
	}
	return total;
};
