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
