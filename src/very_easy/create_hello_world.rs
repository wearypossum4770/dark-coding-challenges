pub fn create_hello_world() -> impl Fn() -> &'static str {
    || "Hello World"
}
