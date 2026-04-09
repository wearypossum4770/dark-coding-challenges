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

#[cfg(test)]
mod tests {
    use super::reverse_words_in_string;
    use rstest::rstest;
    #[rstest]
    #[case("the sky is blue", "blue is sky the")]
    #[case("  hello world  ", "world hello")]
    #[case("a good   example", "example good a")]
    #[case("a", "a")]
    #[case(" a", "a")]
    #[case("a ", "a")]
    #[case(" a ", "a")]
    #[case("  a  ", "a")]
    #[case("hello world", "world hello")]
    #[case("one two three four five", "five four three two one")]
    #[case("  spaces   between   words  ", "words between spaces")]
    #[case("word", "word")]
    #[case("  word  ", "word")]
    #[case("a b", "b a")]
    #[case("a  b", "b a")]
    #[case("a   b   c", "c b a")]
    #[case("Hello World", "World Hello")]
    #[case("UPPER LOWER", "LOWER UPPER")]
    #[case("camelCase pascalCase", "pascalCase camelCase")]
    #[case("abc123 456def", "456def abc123")]
    #[case("foo1 bar2 baz3", "baz3 bar2 foo1")]
    #[case("a1b2c3 d4e5f6 g7h8i9", "g7h8i9 d4e5f6 a1b2c3")]
    #[case("123 456 789", "789 456 123")]
    #[case("1", "1")]
    #[case(" 1 ", "1")]
    #[case("  1  2  3  ", "3 2 1")]
    #[case("the   sky   is   blue", "blue is sky the")]
    #[case("Alice Bob Charlie Dave Eve", "Eve Dave Charlie Bob Alice")]
    #[case(
        "foo bar baz qux quux corge grault garply waldo fred",
        "fred waldo garply grault corge quux qux baz bar foo"
    )]
    #[case("  leading", "leading")]
    #[case("trailing  ", "trailing")]
    #[case("  both  ", "both")]
    #[case("a  b  c  d  e", "e d c b a")]
    #[case("ab cd ef gh ij kl mn op qr st", "st qr op mn kl ij gh ef cd ab")]
    #[case("MixED cAsE wOrDs", "wOrDs cAsE MixED")]
    #[case("x", "x")]
    #[case(" x ", "x")]
    #[case("x y", "y x")]
    #[case(" x  y ", "y x")]
    #[case("a b c", "c b a")]
    #[case(" a  b  c ", "c b a")]
    #[case("word1   word2   word3", "word3 word2 word1")]
    #[case("  first   second   third  ", "third second first")]
    #[case("aA bB cC dD", "dD cC bB aA")]
    #[case(
        "z y x w v u t s r q p o n m l k j i h g f e d c b a",
        "a b c d e f g h i j k l m n o p q r s t u v w x y z"
    )]
    #[case(
        " gtUGyw       sQ       ZaYYygdFe    Rep6lU  o z      QcspISw       k0b9Ts   KkkRVXY7   OUVxX1zsUL      aQ7iiTy      nKCtoS8       Jp  15uAqvNl   W9Mqf7cep    c      WZJ0M3Z       kX       J     en       wUb6 yY     9v      6eq hQs UmNRei   qEjVjL      xmhQMptz   kT     VBLWqIJXRi       qM      L3jQ78    p    TZH     glfOAYah40   GsaSwLnOs     zIiIXd     YgHsUKFd     i7      0       11lASBGl   LKg3a    LDtzIOvWLt   vPKksW Aa  LFTT      M6FyWJ  y5j02N      lKw sBmxVa1Eh     eLl uM2P  q4    7W8r   GV9    KipYyS0 S pA",
        "pA S KipYyS0 GV9 7W8r q4 uM2P eLl sBmxVa1Eh lKw y5j02N M6FyWJ LFTT Aa vPKksW LDtzIOvWLt LKg3a 11lASBGl 0 i7 YgHsUKFd zIiIXd GsaSwLnOs glfOAYah40 TZH p L3jQ78 qM VBLWqIJXRi kT xmhQMptz qEjVjL UmNRei hQs 6eq 9v yY wUb6 en J kX WZJ0M3Z c W9Mqf7cep 15uAqvNl Jp nKCtoS8 aQ7iiTy OUVxX1zsUL KkkRVXY7 k0b9Ts QcspISw z o Rep6lU ZaYYygdFe sQ gtUGyw"
    )]
    fn test_reverse_words_in_string(#[case] s: &str, #[case] expected: &str) {
        assert_eq!(reverse_words_in_string(s.to_string()), expected.to_string());
    }
}
