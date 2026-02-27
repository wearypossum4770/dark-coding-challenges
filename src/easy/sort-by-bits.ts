export const bitTable = (n: number) => {
	const table = Array.from({ length: n }, () => 0);
	table[0] = 0;
	for (let i = 0; i < 256; i++) {
		table[i] = (i & 1) + table[Math.trunc(i / 2)];
	}
	return table;
};
const table = bitTable(255);

export const countSetBits = (n: number) =>
	table[n & 0xff] +
	table[(n >> 8) & 0xff] +
	table[(n >> 16) & 0xff] +
	table[n >> 24];

export const sortByBits = (arr: number[]): number[] => {
	arr.sort((a, b) => countSetBits(a) - countSetBits(b) || a - b);
	return arr;
};
