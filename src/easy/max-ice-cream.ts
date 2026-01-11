export const maxIceCream = (costs: number[], coins: number): number => {
	const sorted = [...costs].sort((a, b) => a - b);
	let remaining = coins;
	let cones = 0;
	for (const cost of sorted) {
		if (cost > remaining) break;
		remaining -= cost;
		cones++;
	}
	return cones;
};
