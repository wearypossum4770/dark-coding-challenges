class Bucket {
  int number;
  int count;
  Bucket(this.number, this.count);
}

List<int> topFrequentElements(List<int> nums, int k) {
  Map<int, Bucket> freq = {};
  for (int n in nums) {
    Bucket bucket = freq[n] ?? Bucket(n, 0);
    bucket.count++;
    freq[n] = bucket;
  }
  List<Bucket> sorted = freq.values.toList();
  sorted.sort((Bucket a, Bucket b) => b.count.compareTo(a.count));
  return sorted.sublist(0, k).map((Bucket a) => a.number).toList();
}
