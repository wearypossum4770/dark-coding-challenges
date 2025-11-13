use std::collections::{HashMap, HashSet};

pub fn most_common_safe_word(paragraph: String, banned: Vec<String>) -> String {
    let separators = ['!', '?', '\'', ',', ';', '.', ' '];
    let banished: HashSet<String> = banned.into_iter().collect();
    let mut freq: HashMap<String, i32> = HashMap::new();

    paragraph
        .to_lowercase()
        .split(|ch| separators.contains(&ch))
        .filter(|word| !word.is_empty() && !banished.contains(*word))
        .for_each(|word| {
            *freq.entry(word.to_string()).or_insert(0) += 1;
        });
    freq.into_iter()
        .max_by_key(|(_, count)| *count)
        .map(|(word, _)| word)
        .unwrap_or_default()
}

#[cfg(test)]
mod tests {
    use super::most_common_safe_word;
    use rstest::rstest;

    #[rstest]
    #[case("Bob hit a ball, the hit BALL flew far after it was hit.".to_string(), &["hit"], "ball")]
    #[case("..Bob hit a ball, the hit BALL flew far after it was hit.".to_string(), &["hit"], "ball")]
    #[case("a.".to_string(), &[], "a")]
    #[case("a b.b".to_string(), &[], "b")]
    #[case("Bob. hIt, baLl".to_string(), &["bob", "hit"], "ball")]
    #[case("Apple pear apple APPLE!".to_string(), &["apple"], "pear")]
    #[case("Wow! wow? wow. really, really... REALLY!".to_string(), &["wow"], "really")]
    #[case("test test test test".to_string(), &[], "test")]
    #[case("word ".repeat(1_000), &[], "word")]
    #[case("apple banana apple banana cherry".to_string(), &["banana"], "apple")]
    fn test_most_common_safe_word(
        #[case] paragraph: String,
        #[case] banned: &[&str],
        #[case] expected: &str,
    ) {
        assert_eq!(
            most_common_safe_word(
                paragraph.to_owned(),
                banned.iter().map(|x| x.to_string()).collect()
            ),
            expected.to_string()
        );
    }
}
