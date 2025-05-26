import Testing

@testable import very_easy

@Test(arguments: [
  (21, 3420), (22, 3600), (3, 180), (4, 360), (5, 540), (6, 720), (7, 900), (8, 1080), (9, 1260),
  (10, 1440), (11, 1620), (12, 1800), (13, 1980), (14, 2160), (15, 2340), (16, 2520), (17, 2700),
  (18, 2880), (19, 3060), (20, 3240),
]) func sumPolygon(side: Int, outcome: Int) { #expect(sumPolygon(side) == outcome) }
