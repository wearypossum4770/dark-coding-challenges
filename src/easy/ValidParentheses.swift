func validParentheses(_ s: String) -> Bool {
  var stack: [Character] = []
  let brackets: [Character: Character] = ["(": ")", "{": "}", "[": "]"]
  for char in s {
    if brackets[char] != nil {
      stack.append(char)
    } else {
      if stack.isEmpty || brackets[stack.last ?? " "] != char { return false }
      stack.removeLast()
    }
  }

  return stack.isEmpty
}
