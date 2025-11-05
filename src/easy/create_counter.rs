#[derive(Default)]
pub struct Counter {
    pub initial: i32,
    pub count: i32,
}

impl Counter {
    fn new(num: i32) -> Self {
        Counter {
            initial: num,
            count: num,
        }
    }
    pub fn get_initial(&self) -> i32 {
        self.initial
    }
    pub fn get_count(&self) -> i32 {
        self.count
    }
}
pub fn create_counter(n: i32) -> impl FnMut() -> i32 {
    let mut counter = Counter::new(n);
    move || {
        let current = counter.count;
        counter.count += 1;
        current
    }
}
pub fn capture(nums: &mut Vec<i32>, index: usize, count: i32) {
    nums[index] = count;
}
