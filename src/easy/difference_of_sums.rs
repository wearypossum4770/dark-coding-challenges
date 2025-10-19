pub fn difference_of_sums(n: i32, m: i32) -> i32 {
    let mut lhs: i32 = 0;
    let mut rhs: i32 = 0;
    for i in 1..=n {
        if i % m == 0 {
            rhs += i;
        } else {
            lhs += i;
        }
    }
    lhs - rhs
}
