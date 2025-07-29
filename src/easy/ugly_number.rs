pub fn ugly_number(n: i32) -> bool {
    let mut num = n;
    if n < 1 {
        return false;
    }
    let primes: [i32; 3] = [2, 3, 5];
    for prime in primes {
        while num % prime == 0 {
            num /= prime;
        }
    }
    return num == 1;
}
