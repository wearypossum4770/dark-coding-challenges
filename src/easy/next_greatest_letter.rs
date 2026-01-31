pub fn next_greatest_letter(letters: Vec<char>, target: char) -> char {
    for &c in letters.iter() {
        if target < c {
            return c;
        }
    }
    letters[0]
}
