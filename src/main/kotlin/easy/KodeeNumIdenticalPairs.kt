package easy
fun kodeeNumIdenticalPairs(nums: IntArray): Int {
	var left = 0
	var count = 0
	while(left < nums.size) {
		var right = left + 1
		while(right < nums.size) {
			if(nums[left] == nums[right])  {
				count ++
			}
			right++
		}
		left++
	}
return count
}