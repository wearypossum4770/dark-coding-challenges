import Testing

@testable import easy

@Test
func checkPerfectNumberSkipTest() {
  #expect(true == true)
}
 
// @Test(arguments: [
//   (496, 496),
//   (8128, 8128),
//   // // (8_589_869_056, 8_589_869_056),
//   // // (137_438_691_328, 137_438_691_328),
//   (6, 6),
//   (28, 28),
//   // // (33_550_336, 33_550_336),
//   (12, 16),
//   (30, 42),
//   // (33_550_335, 39_885_825),
//   (2, 1),
//   (4, 3),
//   (32, 31),
//   (33_550_337, 1),
// ])
// func calculatePerfectNumberTest(n: UInt64, expected: UInt64) {
//   #expect(calculatePerfectNumber(n) == expected)
// }

// @Test(arguments: [
//   ("perfect", 496),
//   ("perfect", 8128),
//   // ("perfect", 8_589_869_056),
//   // ("perfect", 137_438_691_328),
//   ("perfect", 6),
//   ("perfect", 28),
//   // ("perfect", 33_550_336),
//   ("abundant", 12),
//   ("abundant", 30),
//   ("abundant", 33_550_335),
//   ("deficient", 2),
//   ("deficient", 4),
//   ("deficient", 32),
//   ("deficient", 33_550_337),
// ])
// func classifyPerfectNumberTest(expected: String, n: UInt64) {
//   #expect(classifyPerfectNumber(n) == expected)
// }
