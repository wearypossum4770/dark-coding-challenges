public static class SmallerNumbersThanCurrent {
	[Challenge("Smaller Numbers Than Current")]
	public static int[] Solve(int[] nums) {
	int[] result = new int[nums.Length];
	for(int i = 0; i < nums.Length; i++) {
		for(int j = 0; j < nums.Length; j++) {
			if(j != i && nums[i] > nums[j]) {
				result[i]++;
			}
		}
	}
		return result;
	}
}