mod easy;
mod hard;
mod helpers;
mod medium;
mod very_easy;
fn main() {
    println!(
        "Hello, world! {:?}",
        easy::palindrome_number::palindrome_number(313)
    );
    let nums = [1, 3, 5, 7, 9, 11];
    let target = 5;
    helpers::image::base64_to_hex("R0lGODlhAQABAAAAACwAAAAAAQABAAAC");

    easy::counting_sort::counting_sort(&[1, 1, 3, 2, 1]);
    medium::can_be_prepared::can_be_prepared("(E|(M&F))".to_string(), vec!['M', 'B']);
    match nums.binary_search(&target) {
        Ok(index) => println!("Found {} at index {}", target, index),
        Err(_) => println!("{} not found in the array", target),
    }
}
