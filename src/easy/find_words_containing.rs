pub fn find_words_containing(words: Vec<String>, c: char) -> Vec<i32> {
    words
        .iter()
        .enumerate()
        .filter(|(_, word)| word.contains(c))
        .map(|(i, _)| i as i32)
        .collect()
}
