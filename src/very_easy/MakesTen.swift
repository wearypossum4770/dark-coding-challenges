func makesTen(_ a: Int, _ b: Int) -> Bool {
  if a == 10 || b == 10 {
    return true
  }
  return a + b == 10
}
