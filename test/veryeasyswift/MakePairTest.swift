import Testing

@testable import very_easy

@Test(arguments: [
  (1, 2, [1, 2]), (21, 82, [21, 82]), (51, 21, [51, 21]), (512124, 215, [512124, 215]),
  (4213, 526, [4213, 526]),
]) func makePair(a: Int, b: Int, outcome: [Int]) { #expect(makePair(a, b) == outcome) }
