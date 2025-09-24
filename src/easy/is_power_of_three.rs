pub fn is_power_of_three(n: i32) -> bool {
if n < 1 {
	return false;
}
let mut num = n;
while num % 3 == 0 {
	num /= 3;
}
num == 1
}
