export const minSubArray = (nums: number[], p: number): number => {
	const total = nums.reduce((a, b) => a + b, 0) % p;

	if (total === 0) return 0;

	const prefix = new Map<number, number>();
	prefix.set(0, -1);

	let r = 0;
	let minLength = nums.length;

	for (let i = 0; i < nums.length; i++) {
		r = (r + nums[i]) % p;

		const need = (r - total + p) % p;
		const previousIndex = prefix.get(need);

		if (previousIndex !== undefined) {
			minLength = Math.min(minLength, i - previousIndex);
		}

		prefix.set(r, i);
	}

	return minLength === nums.length ? -1 : minLength;
};
