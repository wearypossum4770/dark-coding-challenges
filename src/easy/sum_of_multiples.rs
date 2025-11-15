pub fn sum_of_multiples(factor: u64) -> u64 {
    let mut total: u64 = 0;
    for i in 1..=factor {
        if i % 3 == 0 || i % 5 == 0 || i % 7 == 0 {
            total += i;
        }
    }

    total
}

#[cfg(test)]
mod tests {
    use super::{sum_of_multiples};
    use rstest::rstest;
    #[rstest]
    #[case(1, 0)]   
    #[case(2, 0)]   
    #[case(3, 3)]   
    #[case(5, 8)]   
    #[case(7, 21)]  
    #[case(9, 30)]  
    #[case(10, 40)] 
    #[case(12, 52)] 
    #[case(15, 81)] 
    #[case(20, 119)] 
    #[case(21, 140)]
    #[case(50, 691)]
    #[case(100, 2_838)]
    #[case(1_000, 272_066)]
    #[case(200, 10_845)]
    fn test_sum_of_multiples(#[case] factor: u64, #[case] expected: u64) {
        assert_eq!(sum_of_multiples(factor), expected);
    }

}
