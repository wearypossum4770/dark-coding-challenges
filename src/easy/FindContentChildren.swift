func findContentChildren(_ children: [Int], _ cookies: [Int]) -> Int {
  if children.isEmpty || cookies.isEmpty {
    return 0
  }
  let sortedChildren = children.sorted()
  let sortedCookies = cookies.sorted()

  var i = 0
  var j = 0
  while i < sortedChildren.count && j < sortedCookies.count {
    if sortedCookies[j] >= sortedChildren[i] {
      i += 1
    }
    j += 1
  }
  return i
}
