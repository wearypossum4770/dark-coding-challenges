pub fn integer_to_fizz_buzz(n: u32) -> String {
    if n % 15 == 0 {
        return "FizzBuzz".to_string();
    }
    if n % 5 == 0 {
        return "Buzz".to_string();
    }
    if n % 3 == 0 {
        return "Fizz".to_string();
    }
    n.to_string()
}
pub fn fizz_buzz(n: i32) -> Vec<String> {
    let candidate: usize = n.try_into().unwrap();
    let mut target = Vec::with_capacity(candidate);
    for i in 1..=candidate {
        target.push(integer_to_fizz_buzz(i.try_into().unwrap()));
    }
    target
}
