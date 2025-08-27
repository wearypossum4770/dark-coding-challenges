import Foundation

func integerSquareRoot(_ n: UInt64) -> UInt64 {
  var x = n
  var y = (x + 1) / 2
  while y < x {
    x = y
    y = (x + n / x) / 2
  }
  return x
}

func checkPerfectNumber(_ n: UInt64) -> Bool {
  return n > 1 && n == calculatePerfectNumber(n)
}

func calculatePerfectNumber(_ n: UInt64) -> UInt64 {
  if n <= 1 { return 0 }

  var total: UInt64 = 1
  let root = integerSquareRoot(n)
  // iterate safely using Int
  for i in 2...root {

    if n % i == 0 {
      total += i
      let factor = n / i
      if factor != i {
        total += factor
      }
    }
  }

  return total
}

func classifyPerfectNumber(_ n: UInt64) -> String {
  if n <= 1 { return "deficient" }

  let sum = calculatePerfectNumber(n)

  if n == sum {
    return "perfect"
  } else if n < sum {
    return "abundant"
  } else {
    return "deficient"
  }
}
