func createCounter(_ n: Int) -> () -> Int {
  var counter = n
  func inner() -> Int {
    let current = counter
    counter += 1
    return current
  }
  return inner
}

func capture(_ nums: inout [Int], _ index: Int, _ counter: () -> Int) {
  nums[index] = counter()
}
