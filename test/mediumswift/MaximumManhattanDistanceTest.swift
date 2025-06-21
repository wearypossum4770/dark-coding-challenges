import Testing
@testable import medium
@Test(arguments: [
    ("", 9, 0 ),
    // ("NWSE", 1, 3),
    // ("NSWWEW", 3, 6),
])
func maximumManhattanDistanceTest(directions: String, k: Int, outcome: Int) {
 #expect(maximumManhattanDistance(directions, k) == outcome)
}



git add test/mediumswift/MaximumManhattanDistanceTest.swift
git add src/medium/MaximumManhattanDistance.swift
git add src/medium/maximum_manhattan_distance.zig
git add src/medium/maximum_manhattan_distance.rs
git add medium/maximum_manhattan_distance_test.go
git add medium/maximum_manhattan_distance.go
git add test/medium/MaximumManhattanDistanceTest.php
git add src/main/php/Medium/MaximumManhattanDistance.php
git add test/medium/maximum_manhattan_distance_test.dart
git add lib/medium/maximum_manhattan_distance.dart
git add test/medium/maximum-manhattan-distance.test.ts
git add src/medium/maximum-manhattan-distance.ts
git add src/test/java/medium/MaximumManhattanDistanceTest.java
git add src/main/java/medium/MaximumManhattanDistance.java
git add src/test/kotlin/medium/KodeeMaximumManhattanDistanceTest.kt
git add src/main/kotlin/medium/KodeeMaximumManhattanDistance.kt
git add medium/test_maximum_manhattan_distance.py
git add medium/maximum_manhattan_distance.py