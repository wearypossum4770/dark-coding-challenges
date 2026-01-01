export const thirdMax = (nums: number[]): number => {
	const unique = new Set(nums)
	let first = Number.MIN_SAFE_INTEGER
	let second = first
	let third = first
	for(const num of unique) {
		if(first < num) {
			third = second
		second = first
		first = num
		} else if(second < num ) {
			third = second
			second = num
		} else if(third < num) {
			third = num
		}
	}
	if(unique.size < 3)  return first;
	return third;
}