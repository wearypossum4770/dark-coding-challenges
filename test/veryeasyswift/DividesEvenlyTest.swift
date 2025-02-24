import Testing
@testable import very_easy
@Test(arguments: [
(30, 4, false),
(74, 7, false),
(87, 29, true),
(48, 24, true),
(99, 20, false),
(100, 6, false),
(64, 4, true),
(70, 35, true),
(38, 38, true),
(29, 3, false),
(20, 8, false),
(66, 50, false),
(95, 1, true),
(58, 2, true),
(98, 49, true),
	
])
func dividesEvenly(a: Int, b: Int, outcome: Bool) {
 #expect(dividesEvenly(a, b) == outcome)
}