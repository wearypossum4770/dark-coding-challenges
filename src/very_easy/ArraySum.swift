// Memory 1356 KiB
// Runtime 0.09311 seconds
func arraySum(array: [Int], initial: Int? = 0) -> Int {
  if array.isEmpty {
    return 0
  }
  var total = initial ?? array.first ?? 0
  array.forEach { num in
    total += num
  }
  return total
}
