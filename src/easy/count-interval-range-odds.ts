export const countIntervalRangeOdds = (low: number, high: number): number => {
	let correction = 0
	if(low % 2 !== 0 && high % 2 !== 0) {
		correction = 1;
	}
	return Math.floor((high  + 1- low) / 2) + correction
}