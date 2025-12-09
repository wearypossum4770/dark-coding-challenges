func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
  var lhs = students
  var rhs = sandwiches
  var count = 0
  while !lhs.isEmpty && !rhs.isEmpty {
    if count == lhs.count { break }
    if lhs.first == rhs.first {
      lhs.removeFirst()
      rhs.removeFirst()
      count = 0
    } else {
      lhs.append(lhs.removeFirst())
      count += 1
    }
  }
  return lhs.count
}
