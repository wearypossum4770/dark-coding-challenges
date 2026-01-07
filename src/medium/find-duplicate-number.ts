export const findDuplicateNumber = (nums: number[]): number => {
	const result = Array(nums.length + 1).fill(0);
	for (const num of nums) {
		if (result[num - 1] > 0) return num;
		result[num - 1]++;
	}
	return 0;
};
