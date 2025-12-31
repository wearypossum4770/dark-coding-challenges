export const secondLargest = (nums: number[]): number => {
	const arr = new Set(nums);
	let first = Number.MIN_SAFE_INTEGER
	let second = Number.MIN_SAFE_INTEGER
	for(let num of arr) {
		if(first < num) {
			second = first
			first = num
		} if(second < num && first > second) {
			second = num
		}
	}
	return second
}
