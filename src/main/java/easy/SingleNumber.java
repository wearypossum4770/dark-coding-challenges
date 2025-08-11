package easy;
public class SingleNumber {
public int solve(int[] nums) {
int result = 0;
for (int i: nums) {
	result ^= i;
}
return result;
}}