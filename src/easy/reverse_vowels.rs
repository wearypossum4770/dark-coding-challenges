pub fn reverse_vowels(s: String) -> String {
    let vowels: Vec<char> = vec!['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
    let mut chars: Vec<char> = s.chars().collect();
    let mut left = 0;
    let mut right = s.len() - 1;

    while left < right {
        if vowels.contains(&chars[left]) {
            if vowels.contains(&chars[right]) {
                (chars[left], chars[right]) = (chars[right], chars[left]);
                left += 1;
                right -= 1;
            } else {
                right -= 1;
            }
        } else {
            left += 1;
        }
    }
    chars.into_iter().collect()
}
