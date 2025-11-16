func maxSubArray(_ nums: [Int]) -> Int {
  guard !nums.isEmpty else { return 0 }
  var maximum = nums[0]
  var ending = nums[0]
  for i in 1..<nums.count {
    ending = max(ending + nums[i], nums[i])
    maximum = max(maximum, ending)
  }
  return maximum
}
