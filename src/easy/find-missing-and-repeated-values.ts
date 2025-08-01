export const findMissingAndRepeatedValues = (grid: number[][]): number[] => {
	const n = grid.length;

	let expected = n * n * (Math.pow(n, 2) + 1) / 2;
	let repeated = 0;
	
	const freq: Record<number, number> = {}
	for (const cell of grid.flat(Infinity) as number[]) {
		freq[cell] = (freq[cell] || 0) + 1
		if (freq[cell] > 1) {
			repeated = cell;		
		} else {
			expected -= cell;
		}
		
	}

	return [repeated, expected]
}
