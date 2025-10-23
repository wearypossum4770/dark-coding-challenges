package easy;
public class NumIdenticalPairs {
public int  solve(int[] nums) {
	int left = 0;
	int pairs = 0;
	while(left < nums.length) {
		int right = left + 1;
		while( right < nums.length) {
			if(nums[left] == nums[right]) {
				pairs++;
			}
			right++;
		}
		left++;
	}

	return pairs;
}}