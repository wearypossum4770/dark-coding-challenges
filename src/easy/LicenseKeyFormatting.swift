func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
  let chars = s.uppercased().replacingOccurrences(of: "-", with: "")
  var result = ""
  var i = 0
  for char in chars.reversed() {
    if i >= k {
      i = 0
      result.insert("-", at: result.startIndex)
      result.insert(char, at: result.startIndex)
    } else {
      result.insert(char, at: result.startIndex)
    }
    i += 1
  }
  return result
}
