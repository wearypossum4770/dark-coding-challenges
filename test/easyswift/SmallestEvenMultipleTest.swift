import Testing

@testable import easy

@Test(arguments: [
  (1, 2),
  (2, 2),
  (3, 6),
  (4, 4),
  (5, 10),
  (6, 6),
  (7, 14),
  (8, 8),
  (9, 18),
  (10, 10),
  (11, 22),
  (12, 12),
  (13, 26),
  (14, 14),
  (15, 30),
  (16, 16),
  (17, 34),
  (18, 18),
  (19, 38),
  (20, 20),
  (149, 298),
  (150, 150),
  (1, 2),
  (2, 2),
  (150, 150),
  (149, 298),
])
func smallestEvenMultipleTest(n: Int, expect: Int) {
  #expect(smallestEvenMultiple(n) == expect)
}
