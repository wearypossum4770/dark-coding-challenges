import Foundation

func armstrongNumbers(_ number: Int) -> Int {
  guard number >= 0 else { return 0 }

  let digits = String(number).compactMap { Int(String($0)) }
  let power = digits.count
  let sum = digits.reduce(0) { $0 + Int(pow(Double($1), Double(power))) }

  return sum == number ? 1 : 0
}
