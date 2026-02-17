func containsDuplicate(_ nums: [Int]) -> Bool {
  var unique = Set<Int>()
  for n in nums {
    if unique.contains(n) {
      return true
    }
    unique.insert(n)
  }
  return false
}
