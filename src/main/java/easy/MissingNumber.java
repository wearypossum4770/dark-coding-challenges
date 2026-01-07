package easy;

import java.util.stream.IntStream;

public class MissingNumber {
    public int findMissingNumber(int[] nums) {
        int actual = IntStream.of(nums).reduce(0, Integer::sum);
        int expected = nums.length * (nums.length + 1) / 2;
        return expected - actual;
    }

    public int solve(int[] nums) {
        return findMissingNumber(nums);
    }
}
