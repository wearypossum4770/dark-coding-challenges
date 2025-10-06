func pascalsTriangle(_ numRows: Int) -> [[Int]] {
  guard numRows > 0 else { return [] }
  var result: [[Int]] = [[1]]
  for i in (1..<numRows) {
    var row: [Int] = Array(repeating: 1, count: i)
    for j in (1..<row.count) {
      row[j] = result[i - 1][j - 1] + result[i - 1][j]
    }
    row.append(1)
    result.append(row)
  }

  return result
}
