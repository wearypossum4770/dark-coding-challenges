func arrayPairSum(_ nums: [Int]) -> Int {
  return nums.sorted().enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }.reduce(0, +)
}
