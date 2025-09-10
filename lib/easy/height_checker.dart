int heightChecker(List<int> heights) {
  int count = 0;
  List<int> arr = List.from(heights);
  arr.sort();
  for (int i = 0; i < heights.length; i++) {
    if (heights[i] != arr[i]) {
      count++;
    }
  }
  return count;
}
