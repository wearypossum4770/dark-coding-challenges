import Testing

@testable import easy

@Test(arguments: [
  // MARK: - Provided Examples
  ("abcdefd", "d", "dcbaefd"),
  ("xyxzxe", "z", "zxyxxe"),
  ("abcd", "z", "abcd"),

  // MARK: - ch is first character
  ("abcde", "a", "abcde"),
  ("aabcd", "a", "aabcd"),

  // MARK: - ch is last character
  ("abcde", "e", "edcba"),

  // MARK: - Single character strings
  ("a", "a", "a"),
  ("a", "b", "a"),

  // MARK: - ch appears multiple times (only first occurrence matters)
  ("aabcaad", "a", "aabcaad"),
  ("abacaba", "c", "cabaaba"),
  ("abcdabcd", "d", "dcbaabcd"),

  // MARK: - Entire string reversed
  ("dcba", "a", "abcd"),
  ("ba", "a", "ab"),

  // MARK: - Repeated characters
  ("aaaa", "a", "aaaa"),
  ("aaaa", "b", "aaaa"),

  // MARK: - ch at index 1
  ("abcde", "b", "bacde"),

  // MARK: - ch at second-to-last index
  ("abcde", "d", "dcbae"),

  // MARK: - Two character strings
  ("ab", "a", "ab"),
  ("ab", "b", "ba"),
  ("ab", "z", "ab"),

  // MARK: - Palindromes
  ("racecar", "e", "ecarcar"),
  ("racecar", "r", "racecar"),

  // MARK: - Adjacent duplicates around ch
  ("aabba", "b", "baaba"),

  // MARK: - Deep ch
  ("mnopqrstu", "u", "utsrqponm"),

  // MARK: - Cyrillic: ch is first character
  ("абвгд", "а", "абвгд"),

  // MARK: - Cyrillic: ch is last character
  ("абвгд", "д", "дгвба"),

  // MARK: - Cyrillic: ch not present
  ("абвгд", "я", "абвгд"),

  // MARK: - Cyrillic: ch in middle
  ("абвгде", "г", "гвбаде"),

  // MARK: - Cyrillic: ch appears multiple times, only first matters
  ("абагд", "а", "абагд"),

  // MARK: - Cyrillic: single character match
  ("а", "а", "а"),

  // MARK: - Cyrillic: single character no match
  ("а", "б", "а"),

  // MARK: - Cyrillic: entire string reversed
  ("дгвба", "а", "абвгд"),

  // MARK: - Cyrillic: two characters
  ("ба", "а", "аб"),
  ("аб", "а", "аб"),
  ("аб", "б", "ба"),

  // MARK: - Cyrillic: palindrome prefix
  ("шалаш", "л", "лашаш"),

  // MARK: - Cyrillic: repeated characters
  ("аааа", "а", "аааа"),
  ("аааа", "б", "аааа"),

  // MARK: - Mixed ASCII and Cyrillic: ch is Cyrillic, not present in ASCII string
  ("abcde", "а", "abcde"),

  // MARK: - Cyrillic: ch deep in string
  ("абвгдеёж", "ж", "жёедгвба"),
])
func reverseWordPrefixTest(word: String, char: Character, expect: String) {
  #expect(reverseWordPrefix(word, char) == expect)
}
// MARK: - Stress: max-ish length, ch not present
@Test func longStringNoMatch() {
  let word = String(repeating: "a", count: 250)
  #expect(reverseWordPrefix(word, "z") == word)
}

// MARK: - Stress: max-ish length, ch is last char
@Test func longStringChAtEnd() {
  let word = String(repeating: "a", count: 249) + "b"
  let expected = "b" + String(repeating: "a", count: 249)
  #expect(reverseWordPrefix(word, "b") == expected)
}

// MARK: - ch exists but only after non-ch chars
@Test func chDeepInString() { #expect(reverseWordPrefix("mnopqrstu", "u") == "utsrqponm") }

// MARK: - Mixed case sensitivity (all lowercase per constraints, verify no off-by-one)
@Test func adjacentDuplicatesAroundCh() { #expect(reverseWordPrefix("aabba", "b") == "baaba") }
// first 'b' at index 2 -> reverse [0..2]="aab" -> "baa" -> "baaba"

//
// import Testing
// @testable import easy

// @Test(
//     arguments: [
//         // MARK: - Provided Examples
//         ("abcdefd", "d", "dcbaefd"),
//         ("xyxzxe", "z", "zxyxxe"),
//         ("abcd", "z", "abcd"),

//         // MARK: - ch is first character
//         ("abcde", "a", "abcde"),
//         ("aabcd", "a", "aabcd"),

//         // MARK: - ch is last character
//         ("abcde", "e", "edcba"),

//         // MARK: - Single character strings
//         ("a", "a", "a"),
//         ("a", "b", "a"),

//         // MARK: - ch appears multiple times (only first occurrence matters)
//         ("aabcaad", "a", "aabcaad"),
//         ("abacaba", "c", "cabaaba"),
//         ("abcdabcd", "d", "dcbaabcd"),

//         // … all your other test cases …

//         // Last few:
//         (String(repeating: "а", count: 49) + "я", "я", "я" + String(repeating: "а", count: 49)),
//     ]
// )
// func reverseWordPrefixTest(word: String, char: Character, expect: String) {
//     #expect(reverseWordPrefix(word, char) == expect)
// }

// // You can keep the separate stress tests if you want — they are fine
// @Test func longStringNoMatch() {
//     let word = String(repeating: "a", count: 250)
//     #expect(reverseWordPrefix(word, "z") == word)
// }

// @Test func longStringChAtEnd() {
//     let word = String(repeating: "a", count: 249) + "b"
//     let expected = "b" + String(repeating: "a", count: 249)
//     #expect(reverseWordPrefix(word, "b") == expected)
// }
//
