func missingNumber(_ nums: [Int]) -> Int {
  let expected = nums.count * (nums.count + 1) / 2
  return expected - nums.reduce(0) { $0 + $1 }
}
