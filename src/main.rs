mod easy;
mod shapes;
use crate::easy::{grading_students, plus_one, raindrops, space_age, two_sum};

fn main() {
    println!(
        "raindrops {:?} {:?}",
        raindrops::raindrops(1),
        raindrops::raindrops(3)
    );
    println!("plus one {:?}", plus_one::plus_one(vec!(1, 2, 3)));
    println!(
        "\n\n a value here{:?}",
        two_sum::two_sum(Vec::from([2, 7, 11, 15]), 9)
    );
    println!(
        "{:?} \t{:?}",
        space_age::space_age("earth", 1000000000),
        space_age::space_age("mercury", 2134835688)
    );
    println!(
        "\n\n a value here{:?}",
        two_sum::two_sum(Vec::from([3, 2, 4]), 6)
    );
    println!(
        "{:?}",
        grading_students::grading_students(vec![73, 67, 38, 33])
    );
    println!("Hello, world!");
}
