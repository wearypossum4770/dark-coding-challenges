func commonFactors(_ a: Int, _ b: Int) -> Int {
  var count = 0
  let m = max(a, b)
  for i in 1..<m {
    if a % i == 0 && b % i == 0 {
      count += 1
    }
  }

  return count
}
