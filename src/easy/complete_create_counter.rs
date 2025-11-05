pub struct Counter {
    pub init: i32,
    pub counter: i32,
}
impl Counter {
    pub fn new(init: i32) -> Self {
        Self {
            init,
            counter: init,
        }
    }
    pub fn decrement(self: &mut Self) -> i32 {
        self.counter -= 1;
        self.counter
    }
    pub fn increment(self: &mut Self) -> i32 {
        self.counter += 1;
        self.counter
    }
    pub fn reset(self: &mut Self) -> i32 {
        self.counter = self.init;
        self.counter
    }
}
pub fn complete_create_counter(init: i32) -> Counter {
    Counter::new(init)
}

pub fn capture_complete_counter(counter: &mut Counter, actions: Vec<String>) -> Vec<i32> {
    let mut result = vec![0; actions.len()];
    for (i, action) in actions.iter().enumerate() {
        match action.as_str() {
            "increment" => result[i] = counter.increment(),
            "decrement" => result[i] = counter.decrement(),
            _ => result[i] = counter.reset(),
        };
    }
    result
}
