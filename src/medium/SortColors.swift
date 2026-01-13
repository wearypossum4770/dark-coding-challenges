func sortColors(_ nums: inout [Int]) {
  var freq: [Int: Int] = [:]
  for num in nums {
    freq[num] = freq[num, default: 0] + 1
  }
  var index = 0
  for i in 0..<3 {
    var count = freq[i, default: 0]
    while count > 0 {
      nums[index] = i
      count -= 1
      index += 1
    }
  }
}
