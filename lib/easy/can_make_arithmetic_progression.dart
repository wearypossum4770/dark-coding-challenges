bool canMakeArithmeticProgression(List<int> arr) {
  arr.sort((a, b) => a.compareTo(b));
  print(arr);
  int distance = arr[0] - arr[1];
  int index = 1;
  while (index < arr.length - 1) {
    if (distance != arr[index] - arr[index + 1]) return false;
    index++;
  }
  return true;
}
