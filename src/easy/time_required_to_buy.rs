use std::collections::VecDeque;

pub fn time_required_to_buy(tickets: &[i32], k: i32) -> i32 {
    let mut count: i32 = 0;
    let mut queue: VecDeque<(usize, i32)> =
        tickets.iter().enumerate().map(|(i, &t)| (i, t)).collect();
    let size: usize = k as usize;
    while let Some((index, mut remaining)) = queue.pop_front() {
        if remaining > 0 {
            remaining -= 1;
            count += 1;
        }
        if index == size && remaining == 0 {
            break;
        }
        if remaining > 0 {
            queue.push_back((index, remaining));
        }
    }
    count
}
