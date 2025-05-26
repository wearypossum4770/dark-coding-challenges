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
#[cfg(test)]
mod tests {
    use super::valid_parentheses;
    use rstest::rstest;

    #[rstest]
    #[case("()", true)]
    #[case("()[]{}", true)]
    #[case("(]", false)]
    #[case("([)]", false)]
    #[case("{[]}", true)]
    #[case("(((", false)]
    #[case("]", false)]

    fn test_valid_parentheses(#[case] text: String, #[case] expected: bool) {
        assert_eq!(valid_parentheses(text), expected);
    }
}
