int findContentChildren(List<int> children, List<int> cookies) {
  if (children.isEmpty || cookies.isEmpty) return 0;
  int count = 0;
  int i = 0;
  int j = 0;
  children.sort();
  cookies.sort();
  while (i < children.length && j < cookies.length) {
    if (cookies[j] >= children[i]) {
      count += 1;
      i += 1;
    }
    j += 1;
  }
  return count;
}
