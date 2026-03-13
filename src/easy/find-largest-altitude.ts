/**
 *
 * @param gain
 * @returns
 */

export const findLargestAltitude = (gain: number[]): number => {
	let altitude = 0;
	const result = Array(gain.length + 1).fill(0);
	for (let i = 0; i < gain.length; i++) {
		result[i] = gain[i] + altitude;
		altitude += gain[i];
	}
	return Math.max(...result);
};
