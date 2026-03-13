func findLargestAltitude(_ gain: [Int]) -> Int {
  var result = Array(repeating: 0, count: gain.count + 1)
  var altitude = 0
  for i in gain.indices {
    result[i] = gain[i] + altitude
    altitude += gain[i]
  }
  return result.max() ?? 0
}
