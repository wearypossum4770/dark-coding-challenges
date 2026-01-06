func reformatDate(_ date: String) -> String {
  let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  let parts = date.split(separator: " ")
  var day = 0
  for i in parts[0] {
    if i.isNumber {
      day = day * 10 + (i.wholeNumberValue ?? 0)
    }
  }
  return String(
    format: "\(parts[2])-%02d-%02d", (months.firstIndex(of: String(parts[1])) ?? 0) + 1, day)
}
