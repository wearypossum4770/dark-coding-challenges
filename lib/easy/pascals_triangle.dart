List<List<int>> pascalsTriangle(int numRows) {
  if (numRows < 0) return [];
  List<List<int>> result = List.generate(numRows, (i) => List.filled(i + 1, 1));
  for (int i = 2; i < numRows; i++) {
    for (int j = 1; j < i; j++) {
      result[i][j] = result[i - 1][j - 1] + result[i - 1][j];
    }
  }
  return result;
}

List<int> pascalsTriangleAtRow(int rowIndex) {
  return pascalsTriangle(rowIndex + 1)[rowIndex];
}
