mod easy;
mod shapes;

use crate::easy::{grading_students::grading_students, two_sum::two_sum};

fn main() {
    println!(
        "\n\n a value here{:?}",
        two_sum(Vec::from([2, 7, 11, 15]), 9)
    );
    println!("\n\n a value here{:?}", two_sum(Vec::from([3, 2, 4]), 6));
    println!("{:?}", grading_students(vec![73, 67, 38, 33]));
    println!("Hello, world!");
}
