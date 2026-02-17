bool containsDuplicate(List<int> nums) {
  Set<int> unique = {};
  for (int n in nums) {
    if (unique.contains(n)) return true;
    unique.add(n);
  }
  return false;
}
