pub fn sum_of_multiples(factor: u64) -> u64 {
    let mut total: u64 = 0;
    for i in 1..=factor {
        if i % 3 == 0 || i % 5 == 0 || i % 7 == 0 {
            total += i;
        }
    }

    total
}

