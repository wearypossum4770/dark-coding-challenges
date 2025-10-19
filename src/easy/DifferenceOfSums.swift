func differenceOfSums(_ n: Int, _ m: Int) -> Int {
  var lhs = 0
  var rhs = 0
  for i in 1...n {
    if i % m == 0 {
      rhs += i
    } else {
      lhs += i
    }
  }
  return lhs - rhs
}
