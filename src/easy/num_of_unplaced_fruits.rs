pub fn num_of_unplaced_fruits(fruits: Vec<i32>, baskets: Vec<i32>) -> i32 {
    let mut count: i32 = baskets.len() as i32;
    let mut replaced = vec![false; baskets.len()];
    for fruit in fruits.iter() {
        for (i, basket) in baskets.iter().enumerate() {
            if !replaced[i] && basket >= fruit {
                replaced[i] = true;
                count -= 1;
                break;
            }
        }
    }
    count
}
