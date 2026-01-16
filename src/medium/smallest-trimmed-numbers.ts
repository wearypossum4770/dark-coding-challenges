type Rank = {
	index: number;
	value: string;
};
export const smallestTrimmedNumbers = (
	nums: string[],
	queries: number[][],
): number[] => {
	const result = Array(queries.length);
	for (let i = 0; i < queries.length; i++) {
		const [rank, digit] = queries[i];
		const trimmed: Rank[] = nums.map((num, index) => ({
			index,
			value: num.slice(-digit),
		}));
		trimmed.sort((a, b) => a.value.localeCompare(b.value) || a.index - b.index);
		result[i] = trimmed[rank - 1].index;
	}
	return result;
};
