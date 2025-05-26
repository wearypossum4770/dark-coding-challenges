import Testing

@testable import easy

@Test(
  "Palindrome Number",
  arguments: [
    (1_000_021, false),
    (1_611_881_161, true),
    (-121, false),
    (121, true),
    (10, false),
    (-101, false),
    (-10, false),
    (-1, false),
    (3, true),
    (8, true),
    (9, true),
    (11, true),
    (100, false),
    (-101, false),
    (1, true),
    (123, false),
    (313, true),
    (1_000_030_001, false),
    (838, true),
    (77, true),
    (95159, true),
    (839, false),
    (4234, false),
    (13, false),
  ]) func palindromeNumberTest(_ candidate: Int, _ output: Bool) async throws
{ #expect(palindromeNumber(candidate) == output) }
