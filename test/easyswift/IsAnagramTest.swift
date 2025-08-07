import Testing

@testable import easy

@Test(arguments: [
  ("anagram", "nagaram", true), ("listen", "silent", true), ("triangle", "integral", true),
  ("apple", "pale", false), ("aacc", "ccac", false),
  // Edge cases
  ("", "", true),  // Two empty strings are anagrams
  ("a", "a", true),  // Single character strings are anagrams
  ("a", "b", false),  // Different single characters are not anagrams
  ("aaaaa", "aaaaa", true),  // Identical strings
  ("abcd", "abdc", true),  // String with repeated characters

]) func isAnagramTest(first: String, second: String, outcome: Bool) {
  #expect(isAnagram(first, second) == outcome)
}

@Test(arguments: [
  (
    ["gallery", "regally", "largely"], "allergy",
    ["gallery", "ballerina", "regally", "clergy", "largely", "leading"], "detects three anagrams"
  ),
  (["inlets"], "listen", ["enlists", "google", "inlets", "banana"], "detects anagram"),
  ([], "good", ["dog", "goody"], "does not detect anagram subsets"),
  (
    ["lemons", "melons"], "solemn", ["lemons", "cherry", "melons"], "detects two anagrams"
  ),
  ([], "diaper", ["hello", "world", "zombies", "pants"], "no matches"),
  (["Eons", "ONES"], "nose", ["Eons", "ONES"], "detects multiple anagrams with different case"),
  ([], "mass", ["last"], "does not detect non-anagrams with identical checksum"),
  (
    ["Carthorse"], "Orchestra", ["cashregister", "Carthorse", "radishes"],
    "detects anagrams case-insensitively"
  ),
  (
    ["carthorse"], "Orchestra", ["cashregister", "carthorse", "radishes"],
    "detects anagrams using case-insensitive subject"
  ),
  (
    ["Carthorse"], "orchestra", ["cashregister", "Carthorse", "radishes"],
    "detects anagrams using case-insensitive possible matches"
  ),
  ([], "go", ["goGoGO"], "does not detect an anagram if the original word is repeated"),
  ([], "tapper", ["patter"], "anagrams must use all letters exactly once"),
  ([], "BANANA", ["BANANA"], "words are not anagrams of themselves"),
  (
    [], "BANANA", ["Banana"],
    "words are not anagrams of themselves even if letter case is partially different"
  ),
  (
    [], "BANANA", ["banana"],
    "words are not anagrams of themselves even if letter case is completely different"
  ),
  (["Silent"], "LISTEN", ["LISTEN", "Silent"], "words other than themselves can be anagrams"),
])
func TestDetectAnagram(expected: [String], word: String, candidates: [String], criteria: String) {
  #expect(DetectAnagram(word, candidates) == expected, "\(criteria) failed")
}
