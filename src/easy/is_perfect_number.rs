pub fn is_perfect_number(n: i32) -> bool {
if n <= 1 {
        return false;
    }

    let mut sum: i64 = 1;          
    let sqrt = (n as f64).sqrt() as i32;

    for i in 2..=sqrt {
        if n % i == 0 {
            sum += i as i64;
            let pair = n as i64 / i as i64;
            if pair != i as i64 {
                sum += pair;
            }
        }
    }
    sum == n as i64
}
