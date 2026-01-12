func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
  var result = Array(repeating: 0, count: arr1.count)
  var freq: [Int: Int] = [:]
  var index = 0
  for num in arr1 {
    freq[num, default: 0] += 1
  }
  for num in arr2 {
    var count = freq[num, default: 0]
    while count > 0 {
      result[index] = num
      count -= 1
      index += 1
    }
    freq[num] = nil
  }

  for key in freq.keys.sorted() {
    if var current = freq[key] {
      while current > 0 {
        result[index] = key
        index += 1
        current -= 1
      }

    }
  }
  return result
}
