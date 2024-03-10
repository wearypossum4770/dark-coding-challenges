pub fn make_pair(a: u32, b: u32) -> [u32; 2] {
    [a, b]

}
#[cfg(test)]
mod tests {
use super::make_pair;
#[test]
fn test_make_pair() {
assert_eq!(make_pair(1, 2), [1, 2]);
assert_eq!(make_pair(21, 82), [21, 82]);
assert_eq!(make_pair(4213, 526), [4213, 526]);
}
}