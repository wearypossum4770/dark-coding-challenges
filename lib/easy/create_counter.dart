int Function() createCounter(int n) {
  int count = n;

  int increment() {
    int current = count;
    count++;
    return current;
  }

  return increment;
}

void counterCapture(List<int> nums, int index, int Function() callback) {
  nums[index] = callback();
}
