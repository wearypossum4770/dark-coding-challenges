func majorityFrequencyGroup(_ s: String) -> String {
  var freq: [Character: Int] = [:]
  var entries: [Int: String] = [:]
  for char in s {
    freq[char, default: 0] += 1
  }
  for (k, v) in freq {
    entries[v, default: ""] += String(k)
  }
  let groups = entries.sorted {
    let a = $0.value.count
    let b = $1.value.count
    if a != b {
      return a > b
    }
    return $0.key > $1.key
  }
  let (key, value) = groups[0]
  return value
}
