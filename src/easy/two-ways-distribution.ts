import { FenwickTree } from '../helpers/data-structures'
export const twoWaysDistribution = (nums: number[]): number[] => {
	const [first, second] = [[nums[0]], [nums[1]]]
	for (const num of nums.slice(2)) {
		let  f = first.filter(v=> v > num), s = second.filter(v=> v > num)
		if (f.length === s.length) {
			if( second.length < first.length) {
				second.push(num)
			}else {
			first.push(num)
			}
		}
		if (f.length > s.length) {
			first.push(num)
		}
		else if (f.length < s.length) {
			second.push(num)
		}
	}
	return first.concat(second)
}
