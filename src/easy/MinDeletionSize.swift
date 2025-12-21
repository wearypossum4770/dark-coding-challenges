func minDeletionSize(_ strs: [String]) -> Int {
  var count = 0
  let rows = strs.count
  let cols = strs[0].count
  let grid = strs.map { Array($0) }
  for col in 0..<cols {
    for row in 1..<rows {
      if grid[row - 1][col] > grid[row][col] {
        count += 1
        break
      }
    }
  }
  return count
}
