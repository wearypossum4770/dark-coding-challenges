package easy

func SearchInsertPosition(nums []int, target int) int {
	left, right := 0, len(nums)-1
	for left <= right {
		mid := left + (right-left)/2
		if nums[mid] == target {
			return mid
		}
		if nums[mid] < target {
			left = mid + 1
		} else {
			right = mid - 1
		}
	}

	return left
}

// rm test/easyswift/SearchInsertPositionTest.swift
// rm src/easy/SearchInsertPosition.swift
// rm src/easy/search_insert_position.zig
// rm src/easy/search_insert_position.rs
// rm easy/search_insert_position_test.go
// rm easy/search_insert_position.go
// rm test/easy/SearchInsertPositionTest.php
// rm src/main/php/Easy/SearchInsertPosition.php
// rm test/easy/search_insert_position_test.dart
// rm lib/easy/search_insert_position.dart
// rm test/easy/search-insert-position.test.ts
// rm src/easy/search-insert-position.ts
// rm src/test/java/easy/SearchInsertPositionTest.java
// rm src/main/java/easy/SearchInsertPosition.java
// rm src/test/kotlin/easy/KodeeSearchInsertPositionTest.kt
// rm src/main/kotlin/easy/KodeeSearchInsertPosition.kt
// rm easy/test_search_insert_position.py
// rm easy/search_insert_position.py
