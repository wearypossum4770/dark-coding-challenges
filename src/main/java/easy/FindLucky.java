package easy;

import java.util.Arrays;

public class FindLucky {
public int solve(int[] arr) {
	int max = Arrays.stream(arr).max().getAsInt();
	int[] nums = new int[max + 1];
	for (int i : arr) {
		nums[i]++;
	}
	for(int i = nums.length - 1; i > 0; i--) {
		if(i == nums[i]) return i;
	}
	
return -1;
}}