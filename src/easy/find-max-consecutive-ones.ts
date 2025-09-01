export const findMaxConsecutiveOnes = (nums: number[]): number => {
	let count = 0, max = 0;
	nums.forEach((num) => {
		if (num === 1) {
			count++;
		}else {
			max = Math.max(max, count);
			count = 0;
		}
	})
	max = Math.max(max, count);
	return max;
}