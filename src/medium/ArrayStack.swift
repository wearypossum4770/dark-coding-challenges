func arrayStack(_ target: [Int], _ n: Int) -> [String] {
  var result = [String]()
  var counter = 1
  var index = 0
  while index < target.count {
    result.append("Push")
    if target[index] == counter {
      index += 1
    } else {
      result.append("Pop")
    }
    counter += 1
  }
  return result
}
