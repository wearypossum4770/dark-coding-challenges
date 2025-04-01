pub fn can_be_prepared(recipe: String, ingredients: Vec<char>) -> bool {
    let mut outer: Vec<Vec<bool>> = Vec::new();
    let mut stack: Vec<char> = Vec::new();
    let mut inner: Vec<bool> = Vec::new();
    for ingredient in recipe.chars() {
        match ingredient {
            '|' => {
                outer.push(inner.clone());
                inner.clear();
            }
            '(' | '&' => {
                stack.push(ingredient);
            }
            ')' => {
                if let Some('(') = stack.pop() {
                    if !inner.is_empty() {
                        outer.push(inner.clone());
                        inner.clear();
                    }
                }
            }
            'A'..='Z' | 'a'..='z' => {
                inner.push(ingredients.contains(&ingredient));
            }
            _ => {}
        };
    }
    if !inner.is_empty() {
        outer.push(inner.clone());
    }
    outer.iter().any(|arr| arr.iter().all(|v| *v))
}
#[cfg(test)]
mod tests {
    use super::can_be_prepared;
    use rstest::rstest;

    #[rstest]
    #[case("".to_string(), vec![], false)]
    #[case("O".to_string(), vec!['O'], true)]
    #[case("B|O".to_string(), vec!['O'], true)]
    #[case("O|B".to_string(), vec!['O'], true)]
    #[case("B|O".to_string(), vec!['O', 'B'], true)]
    #[case("B".to_string(), vec!['O'], false)]
    #[case("(O&M)".to_string(), vec!['O'], false)]
    #[case("(M&O)".to_string(), vec!['O'], false)]
    #[case("(O|B)".to_string(), vec!['O', 'B'], true)]
    #[case("(M&F)".to_string(), vec!['M', 'F'], true)]
    #[case("(M&F)".to_string(), vec!['M', 'E'], false)]
    #[case("(B|O|L)".to_string(), vec!['B', 'M', 'F'], true)]
    #[case("(B&M&S&F)".to_string(), vec!['B', 'M', 'F', 'S'], true)]
    #[case("(E|(M&F))".to_string(), vec!['M', 'E'], true)]
    #[case("(E|(M&F))".to_string(), vec!['M', 'B'], false)]
    #[case("( M & F )".to_string(), vec!['M', 'F'], true)]
    #[case("(E|(M&F))".to_string(), vec!['M', 'F'], true)]
    #[case("(M&(F&G))".to_string(), vec!['M', 'F', 'G'], true)]
    #[case ("(M&(F&G))".to_string(), vec![], false)]
    #[case ("(M&(F&E))".to_string(), vec!['M', 'F', 'G'], false)]
    // test cases provided by Chat GPT
    #[case("((A&B)|C)".to_string(), vec!['A', 'B'], true)]
    #[case("((A&B)|C)".to_string(), vec!['C'], true)]
    #[case("((A&B)|C)".to_string(), vec!['A'], false)]
    #[case("(A&(B|C))".to_string(), vec!['A', 'B'], true)]
    #[case("(A&(B|C))".to_string(), vec!['A', 'C'], true)]
    #[case("(A&(B|C))".to_string(), vec!['A'], false)]
    #[case("((A&B)&C)".to_string(), vec!['A', 'B', 'C'], true)]
    #[case("(A&B)|(C&D)".to_string(), vec!['A'], false)]
    #[case("((A&B)&C)".to_string(), vec!['A', 'B'], false)]
    #[case("((A|B)&(C|D))".to_string(), vec!['A', 'C'], true)]
    #[case("((A|B)&(C|D))".to_string(), vec!['B', 'D'], true)]
    // #[case("((A|B)&(C|D))".to_string(), vec!['A'], false)]
    #[case("((((A&B)|C)&D)|E)".to_string(), vec!['E'], true)]
    #[case("((((A&B)|C)&D)|E)".to_string(), vec!['A', 'B', 'D'], true)]
    // #[case("((((A&B)|C)&D)|E)".to_string(), vec!['A', 'B'], false)]
    fn test_can_be_prepared(
        #[case] recipe: String,
        #[case] ingredients: Vec<char>,
        #[case] expected: bool,
    ) {
        assert_eq!(can_be_prepared(recipe, ingredients), expected);
    }
}
