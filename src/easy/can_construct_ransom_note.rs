pub fn can_construct_ransom_note(ransom_note: String, magazine: String) -> bool {
    let mut freq = vec![0; 26];
    for ch in magazine.chars() {
        if ch.is_ascii_alphabetic() {
            let idx = (ch.to_ascii_lowercase() as u8 - b'a') as usize;
            freq[idx] += 1;
        }
    }
    for ch in ransom_note.chars() {
        if ch.is_ascii_alphabetic() {
            let idx = (ch.to_ascii_lowercase() as u8 - b'a') as usize;
            freq[idx] -= 1;
            if freq[idx] < 0 {
                return false;
            }
        }
    }
    true
}

