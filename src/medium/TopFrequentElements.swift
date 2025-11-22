struct Bucket {
  var num: Int
  var count: Int
  init(_ num: Int) {
    self.num = num
    self.count = 0
  }
}
func topFrequentBucketElements(_ nums: [Int], _ k: Int) -> [Int] {
  var freq: [Int: Bucket] = [:]
  for n in nums {
    var count = freq[n, default: Bucket(n)]
    count.count += 1
    freq[n] = count
  }
  let sortedFreq = freq.values.sorted { $0.count > $1.count }.map { $0.num }
  return Array(sortedFreq.prefix(k))
}

func topFrequentElements(_ nums: [Int], _ k: Int) -> [Int] {
  var freq: [Int: Int] = [:]
  for n in nums {
    freq[n, default: 0] += 1
  }
  return Array(freq.sorted { $0.value > $1.value }.map { $0.key }.prefix(k))
}
