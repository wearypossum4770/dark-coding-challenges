pub fn number_of_steps_to_zero(num: i32) -> i32 {
    if num < 0 {
        return 0;
    }
    let mut n = num;
    let mut steps = 0;
    while n > 0 {
        if n % 2 == 0 {
            n /= 2;
        } else {
            n -= 1;
        }
        steps += 1;
    }
    steps
}
	