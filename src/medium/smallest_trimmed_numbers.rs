struct Rank <'a>{
	index: usize,
	value: &'a str
}
impl <'a> Rank<'a> {
	pub fn new(index: usize, value: &'a str) -> Self {
		Self { index, value }
	}
}
pub fn smallest_trimmed_numbers(nums: Vec<String>, queries: Vec<Vec<i32>>) -> Vec<i32> {
	let mut result: Vec<i32> = vec![0; 0];
	for query in &queries {
		let rank = query[0] as usize;
		let digit = query[1] as usize;
		let mut trimmed: Vec<Rank> = nums.iter().enumerate().map(|(index, num)| {
			let value = num.split_at(num.len().saturating_sub(digit));
			Rank::new(index, value.1)
		}).collect();
		trimmed.sort_by(|a, b| a.value.cmp(b.value).then(a.index.cmp(&b.index)));
		result.push(trimmed[rank.saturating_sub(1)].index as i32);
	}
    result
}
#[cfg(test)]
mod tests {
    use super::smallest_trimmed_numbers;
    use rstest::rstest;
    #[rstest]
#[case(
    &["102", "473", "251", "814"],
    &[vec![1, 1], vec![2, 3], vec![4, 2], vec![1, 2],],
    &[2, 2, 1, 0]
)]
#[case(
    &["24", "37", "96", "04"],
    &[vec![2, 1], vec![2, 2],],
    &[3, 0]
)]
#[case(
    &["000", "000", "000", "000"],
    &[vec![1, 1], vec![2, 1], vec![3, 1], vec![4, 1],],
    &[0, 1, 2, 3]
)]
#[case(
    &["0", "0", "0", "0"],
    &[vec![1, 1], vec![2, 1], vec![3, 1], vec![4, 1],],
    &[0, 1, 2, 3]
)]
#[case(
    &["123456789", "987654321", "111111111", "000000000"],
    &[vec![1, 9], vec![2, 9], vec![3, 9], vec![4, 9],],
    &[3, 2, 0, 1]
)]
#[case(
    &["9", "8", "7", "6", "5", "4", "3", "2", "1", "0"],
    &[vec![1, 1], vec![5, 1], vec![10, 1],],
    &[9, 5, 0]
)]
#[case(
    &["100", "200", "300", "400", "500"],
    &[vec![1, 2], vec![2, 2], vec![3, 2], vec![4, 2], vec![5, 2],],
    &[0, 1, 2, 3, 4]
)]
// #[case(
//     &["00100", "00101", "00110", "00111", "01000"],
//     &[vec![1, 3], vec![2, 3], vec![3, 3], vec![4, 3], vec![5, 3],],
//     &[0, 1, 2, 3, 4]
// )]
#[case(
    &["99999", "99998", "99997", "99996", "99995"],
    &[vec![1, 5], vec![2, 5], vec![3, 5], vec![4, 5], vec![5, 5],],
    &[4, 3, 2, 1, 0]
)]
#[case(
    &["00001", "00010", "00100", "01000", "10000"],
    &[vec![1, 5], vec![2, 5], vec![3, 5], vec![4, 5], vec![5, 5],],
    &[0, 1, 2, 3, 4]
)]
#[case(
    &["123", "123", "123", "123", "123"],
    &[vec![1, 3], vec![2, 3], vec![3, 3], vec![4, 3], vec![5, 3],],
    &[0, 1, 2, 3, 4]
)]
#[case(
    &["000", "001", "002", "010", "100"],
    &[vec![1, 3], vec![2, 3], vec![3, 3], vec![4, 3], vec![5, 3],],
    &[0, 1, 2, 3, 4]
)]
#[case(
    &["9876543210", "8765432109", "7654321098", "6543210987", "5432109876"],
    &[vec![1, 10], vec![3, 10], vec![5, 10],],
    &[4, 2, 0]
)]
#[case(
    &["1", "10", "100", "1000", "10000"],
    &[vec![1, 5], vec![2, 5], vec![3, 5], vec![4, 5], vec![5, 5],],
    &[0, 1, 2, 3, 4]
)]
#[case(
    &["999", "998", "997", "996", "995", "994", "993", "992", "991", "990"],
    &[vec![1, 3], vec![5, 3], vec![10, 3],],
    &[9, 5, 0]
)]
#[case(
    &["0000000000", "0000000001", "0000000010", "0000000100", "0000001000"],
    &[vec![1, 10], vec![2, 10], vec![3, 10], vec![4, 10], vec![5, 10],],
    &[0, 1, 2, 3, 4]
)]
#[case(
    &["1111111111", "2222222222", "3333333333", "4444444444", "5555555555"],
    &[vec![1, 10], vec![2, 10], vec![3, 10], vec![4, 10], vec![5, 10],],
    &[0, 1, 2, 3, 4]
)]
#[case(
    &["1000000000", "999999999", "999999998", "999999997", "999999996"],
    &[vec![1, 10], vec![2, 10], vec![3, 10],],
    &[0, 4, 3]
)]
#[case(
    &["000", "001", "010", "100", "999"],
    &[vec![1, 3], vec![2, 3], vec![3, 3], vec![4, 3], vec![5, 3],],
    &[0, 1, 2, 3, 4]
)]
#[case(
    &["000000", "000001", "000010", "000100", "001000", "010000", "100000"],
    &[vec![1, 6], vec![3, 6], vec![5, 6], vec![7, 6],],
    &[0, 2, 4, 6]
)]

    fn test_smallest_trimmed_numbers(
        #[case] nums: &[&str],
				#[case] queries: &[Vec<i32>],
        #[case] expected: &[i32],
    ) {
        let n = nums.iter().map(|x| x.to_string()).collect();
        let q: Vec<Vec<i32>> = queries.iter().map(|x| x.to_vec()).collect();
        assert_eq!(smallest_trimmed_numbers(n, q), expected.to_vec());
    }
}
