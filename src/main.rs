mod easy;
// mod helpers;
mod medium;
// mod shapes;

fn main() {
    let orders = vec![vec![1, 2], vec![2, 1], vec![1, 2]];

    println!("{:?}", easy::jim_orders::jim_orders(&orders),);
    println!("Hello, world!");
}
