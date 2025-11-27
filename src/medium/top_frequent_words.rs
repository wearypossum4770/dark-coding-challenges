use std::collections::HashMap;

pub fn top_frequent_words(words: Vec<String>, k: i32) -> Vec<String> {
    let mut freq: HashMap<&String, i32> = HashMap::new();
    for word in words.iter() {
        freq.entry(word).and_modify(|c| *c += 1).or_insert(1);
    }
    let mut sorted: Vec<(&&String, &i32)> = freq.iter().collect();
    sorted.sort_by(|a, b| b.1.cmp(a.1).then(a.0.cmp(b.0)));
    let result = sorted
        .iter()
        .map(|(key, _)| key.to_string())
        .collect::<Vec<String>>();
    result[0..k as usize].to_vec()
}
#[cfg(test)]
mod tests {
    use super::top_frequent_words;
    use rstest::rstest;
    #[rstest]
    #[case(&["i","love","leetcode","i","love","coding"], 2, &["i","love"])]
    #[case(&["i", "love", "leetcode", "i", "love", "coding"], 3, &["i", "love", "coding"])]
    #[case(&["the","day","is","sunny","the","the","the","sunny","is","is"], 4, &["the","is","sunny","day"])]
    #[case(&["i","love","leetcode","i","love","coding"], 3, &["i","love","coding"])]
    #[case(&["hello","hello","hello"], 1, &["hello"])]
    #[case(&["a","b","c","d"], 4, &["a","b","c","d"])]
    #[case(&["apple","banana","apple","banana","cherry","cherry"], 3, &["apple","banana","cherry"])]
    #[case(&["x","y","z"], 1, &["x"])]
    #[case(&[], 0, &[])]
    #[case(&["a","aa","aaa","a","aaa","aaa","aa","b","b","b"], 3, &["aaa","b","a"])]
    #[case(&["one","two"], 2, &["one","two"])]
    fn test_top_frequent_words(#[case] words: &[&str], #[case] k: i32, #[case] expected: &[&str]) {
        assert_eq!(
            top_frequent_words(words.iter().map(|x| x.to_string()).collect(), k),
            expected
                .iter()
                .map(|x| x.to_string())
                .collect::<Vec<String>>()
        );
    }
}
