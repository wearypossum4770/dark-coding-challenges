package medium;

public class FindDuplicateNumber {
    public int solve(int[] nums) {
        int[] arr = new int[nums.length];
        for (int i : nums) {
            if (arr[i - 1] > 0) return i;
            arr[i - 1] = i;
        }
        return 0;
    }
}
