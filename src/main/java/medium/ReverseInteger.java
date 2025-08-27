package medium;
public class ReverseInteger {
		public int solve(int x) {
		long result = 0;
		while(x != 0) {
			result = result * 10 + x%10;
			x /= 10;
		}
		if(result > 0x7fffffff || result < Integer.MIN_VALUE) return 0;
		
	return (int) result;
	}
}