func minSubArray(_ nums: [Int], _ p: Int) -> Int {
  let total = nums.reduce(0, +) % p

  if total == 0 {
    return 0
  }

  var prefixSum = 0
  var result = nums.count
  var map: [Int: Int] = [0: -1]
  for (i, num) in nums.enumerated() {
    prefixSum = (prefixSum + num) % p
    let lookup = (prefixSum - total + p) % p
    if let previous = map[lookup] {
      result = min(result, i - previous)
    }

    map[prefixSum] = i
  }
  return result == nums.count ? -1 : result
}
