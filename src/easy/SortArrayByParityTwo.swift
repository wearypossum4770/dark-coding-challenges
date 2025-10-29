func sortArrayByParityTwo(_ nums: [Int]) -> [Int] {
  var result = Array(repeating: 0, count: nums.count)
  var even = 0
  var odd = 1
  for n: Int in nums {
    if n % 2 == 0 {
      result[even] = n
      even += 2
    } else {
      result[odd] = n
      odd += 2
    }
  }

  return result
}
