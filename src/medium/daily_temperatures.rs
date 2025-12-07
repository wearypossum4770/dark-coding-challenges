pub fn daily_temperatures(temperatures: Vec<i32>) -> Vec<i32> {
    let mut result = vec![0; temperatures.len()];
    let mut stack: Vec<i32> = Vec::new();
    for i in 0..temperatures.len() {
        while let Some(&previous) = stack.last() {
            if temperatures[i] <= temperatures[previous as usize] {
                break;
            }
            result[previous as usize] = i as i32 - previous;
            stack.pop();
        }
        stack.push(i as i32);
    }
    result
}