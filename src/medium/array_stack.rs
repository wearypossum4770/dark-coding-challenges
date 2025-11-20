pub fn array_stack(target: Vec<i32>, n: i32) -> Vec<String> {
    let mut result: Vec<String> = Vec::with_capacity(n as usize);
    let mut index: usize = 0;
    let mut counter: i32 = 1;
    while index < target.len() {
        result.push("Push".to_string());
        if target[index] == counter {
            index += 1;
        } else {
            result.push("Pop".to_string());
        }
        counter += 1;
    }

    result
}
