func intToFizzBuzz(_ n: Int) -> String {
  if n % 15 == 0 { return "FizzBuzz" }
  if n % 5 == 0 { return "Buzz" }
  if n % 3 == 0 { return "Fizz" }
  return String(n)
}
func fizzBuzz(_ n: Int) -> [String] {
  guard n > 0 else { return [] }
  var result = [String](repeating: "", count: n)
  for i in (0...n - 1) {
    result[i] = intToFizzBuzz(i + 1)
  }
  return result
}
