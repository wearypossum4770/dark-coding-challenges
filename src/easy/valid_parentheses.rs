use std::collections::HashMap;

pub fn valid_parentheses(s: String) -> bool {
    let mut stack: Vec<char> = Vec::with_capacity(s.len());
    let brackets: HashMap<char, char> = HashMap::from([('(', ')'), ('{', '}'), ('[', ']')]);
    for c in s.chars() {
        if brackets.contains_key(&c) {
            stack.push(c);
        } else {
            if stack.is_empty() || brackets.get(stack.last().unwrap_or(&' ')) != Some(&c) {
                return false;
            }
            stack.pop();
        }
    }
    stack.is_empty()
}
