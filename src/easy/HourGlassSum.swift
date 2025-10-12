func hourGlassSum(_ grid: [[Int]]) -> Int {
  guard !grid.isEmpty, grid.count >= 3, !grid[0].isEmpty, grid[0].count >= 3 else {
    return 0
  }
  var result = Int.min
  for (i, row) in grid[0..<grid.endIndex - 2].enumerated() {
    for j in row[0..<row.endIndex - 2].indices {
      let hourglass =
        grid[i][j] + grid[i][j + 1] + grid[i][j + 2] + grid[i + 1][j + 1] + grid[i + 2][j]
        + grid[i + 2][j + 1] + grid[i + 2][j + 2]
      result = max(result, hourglass)
    }
  }
  return result
}
