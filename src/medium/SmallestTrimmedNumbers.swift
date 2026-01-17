func smallestTrimmedNumbers(_ nums: [String], _ queries: [[Int]]) -> [Int] {
  var result: [Int] = Array(repeating: 0, count: queries.count)
  for (index, query) in queries.enumerated() {
    let rank: Int = query[0] - 1
    let trimmed: [(Int, String)] = nums.enumerated().map { (offset, num) -> (Int, String) in
      return (offset, String(num.suffix(query[1])))
    }.sorted { lhs, rhs in
      if lhs.1 != rhs.1 {
        return lhs.1 < rhs.1
      }
      return lhs.0 < rhs.0
    }
    result[index] = trimmed[rank].0
  }

  return result
}
