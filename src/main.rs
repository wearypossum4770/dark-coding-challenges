mod easy;
// mod helpers;
// mod medium;
// mod shapes;

fn main() {
    println!(
        "{:?}",
        easy::maximum_toys::maximum_toys(
            &[
                33324560, 77661073, 31948330, 21522343, 97176507, 5724692, 24699815, 12079402,
                6479353, 28430129, 42427721, 57127004, 26256001, 29446837, 65107604, 9809008,
                65846182, 8470661, 13597655, 360
            ],
            100_000
        )
    );
    println!("Hello, world!");
}
