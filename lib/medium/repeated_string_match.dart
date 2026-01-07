int repeatedStringMatch(String a, String b) {
  String repeated = a;
  int count = 1;
  while (repeated.length < b.length) {
    count++;
    repeated += a;
  }
  if (repeated.contains(b)) return count;
  repeated += a;
  if (repeated.contains(b)) return count + 1;

  return -1;
}
