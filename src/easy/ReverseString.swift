func reverseString(_ s: inout [Character]) {
  var left = 0
  var right = s.endIndex - 1
  var char: Character
  while left < right {
    char = s[left]
    s[left] = s[right]
    s[right] = char
    left += 1
    right -= 1
  }
}
