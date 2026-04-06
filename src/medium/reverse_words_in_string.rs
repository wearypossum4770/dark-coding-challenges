pub fn reverse_words_in_string(s: String) -> String {
    let mut result = Vec::new();
    let words = s.trim().split(" ").collect::<Vec<&str>>();
    for i in (0..words.len()).rev() {
        match words.get(i) {
            Some(&word) => {
                if !word.is_empty() {
                    result.push(word);
                }
            }
            None => {}
        };
    }
    result.join(" ")
}
