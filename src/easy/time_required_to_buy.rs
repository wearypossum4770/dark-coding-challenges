use std::collections::VecDeque;

pub fn time_required_to_buy(tickets: &[i32], k: i32) -> i32 {
    let mut count: i32 = 0;
    let mut queue: VecDeque<(usize, i32)> =
        tickets.iter().enumerate().map(|(i, &t)| (i, t)).collect();
    let size: usize = k as usize;
    while let Some((index, mut remaining)) = queue.pop_front() {
        if remaining > 0 {
            remaining -= 1;
            count += 1;
        }
        if index == size && remaining == 0 {
            break;
        }
        if remaining > 0 {
            queue.push_back((index, remaining));
        }
    }
    count
}
#[cfg(test)]
mod tests {
    use super::time_required_to_buy;
    use rstest::rstest;
    #[rstest]
    #[case(&[2, 3, 2], 2, 6)]
    #[case(&[5, 1, 1, 1], 0, 8)]
    #[case(&[1], 0, 1)]
    #[case(&[1, 1, 1, 1], 3, 4)]
    #[case(&[3, 3, 3], 0, 7)]
    #[case(&[3, 3, 3], 1, 8)]
    #[case(&[3, 3, 3], 2, 9)]
    #[case(&[1, 2, 3, 4], 3, 10)]
    #[case(&[4, 3, 2, 1], 0, 10)]
    #[case(&[4, 3, 2, 1], 1, 9)]
    #[case(&[4, 3, 2, 1], 2, 7)]
    #[case(&[4, 3, 2, 1], 3, 4)]
    #[case(&[100, 100, 100], 1, 299)]
    #[case(&[1, 100, 1], 1, 102)]
    #[case(&[2, 1], 1, 2)]
    #[case(&[2, 1], 0, 3)]
    #[case(&[1, 2], 0, 1)]
    #[case(&[1, 2], 1, 3)]
    fn test_time_required_to_buy(#[case] tickets: &[i32], #[case] k: i32, #[case] expected: i32) {
        assert_eq!(time_required_to_buy(tickets, k), expected);
    }
}
