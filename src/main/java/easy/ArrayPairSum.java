package easy;

import java.util.Arrays;

public class ArrayPairSum {
    public int solve(int[] nums) {
        int sum = 0;
        Arrays.sort(nums);
        for (int i = nums.length - 2; i >= 0; i -= 2) {
            sum += Math.min(nums[i], nums[i + 1]);
        }

        return sum;
    }
}
