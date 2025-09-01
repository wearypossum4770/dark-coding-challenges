import 'dart:math';

int findMaxConsecutiveOnes(List<int> nums) {
	int count = 0;
	int m = 0;
	nums.forEach((n) {
		if (n == 1) {
			count++;
		}else {
			m = max(m, count);
			count = 0;
		}
	});

	return max(m, count);
}