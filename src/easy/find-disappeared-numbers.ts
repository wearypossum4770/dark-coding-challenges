export const findDisappearedNumbers = (nums: number[]): number[] => {
	const result = Array(nums.length).fill(0);
	for (let i = 0; i < nums.length; i++) {
		result[nums[i] - 1] = nums[i];
	}
	return result.flatMap((n, i) => (n === 0 ? [i + 1] : []));
};
