bool arrayContainsDuplicate(List<int> nums) {
  Set<int> seen = {};
  for (final n in nums) {
    if (seen.contains(n)) return true;
    seen.add(n);
  }
  return false;
}
