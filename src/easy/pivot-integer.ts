export const pivotInteger = (n: number): number => {
	let left = 1;
	let right = n;
	const total = (n ** 2 + n) / 2;
	while (left < right) {
		const mid = Math.trunc((left + right) / 2);
		if (mid * mid - total < 0) {
			left = mid + 1;
		} else {
			right = mid;
		}
	}
	return left * left - total === 0 ? left : -1;
};
