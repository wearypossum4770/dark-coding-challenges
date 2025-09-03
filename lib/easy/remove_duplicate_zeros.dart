void removeDuplicateZeros(List<int> arr) {
  int left = 0;
  int right = arr.length - 1;
  while (left <= right) {
    if (arr[left] == 0) {
      int r = right;
      while (r > left) {
        arr[r] = arr[r - 1];
        r--;
      }
      left++;
    }
    left++;
  }
}
