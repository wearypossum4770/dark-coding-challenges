int minDeletionSize(List<String> strs) {
  int count = 0;
  int rows = strs.length;
  int cols = strs[0].length;
  for (int col = 0; col < cols; col++) {
    int row = 1;
    while (row < rows) {
      if (strs[row - 1].codeUnitAt(col) > strs[row].codeUnitAt(col)) {
        count++;
        break;
      }
      row++;
    }
  }
  return count;
}
