pub fn running_array_sum(nums: Vec<i64>) -> Vec<i64> {
let mut result = vec![0; nums.len()];
for (i, &n) in nums.iter().enumerate() {
	if i == 0 {
		result[i] = n;
	}else {
		result[i] = result[i - 1].saturating_add(n);
	}
}

result.to_vec()
}
#[cfg(test)]
mod tests {
use super::running_array_sum;
use rstest::rstest;
#[rstest]
	#[case("✅ Normal case", vec![1, 2, 3, 4], vec![1, 3, 6, 10])]
	#[case("✅ All 1s", vec![1, 1, 1, 1, 1], vec![1, 2, 3, 4, 5])]
	#[case("✅ Mixed values", vec![3, 1, 2, 10, 1], vec![3, 4, 6, 16, 17])]
	#[case("🟢 Empty array", vec![], vec![])]
	#[case("🟢 Single element", vec![5], vec![5])]
	#[case("🟢 Negative numbers", vec![-1, -2, -3], vec![-1, -3, -6])]
	#[case("🟢 Alternating positives & negatives", vec![1, -1, 1, -1, 1], vec![1, 0, 1, 0, 1])]
fn test_running_array_sum(#[case] criteria: &str, #[case] nums: Vec<i64>, #[case] expected: Vec<i64>) {
assert_eq!(running_array_sum(nums), expected);
}
}