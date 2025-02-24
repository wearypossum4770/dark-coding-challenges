// Main entry
let n = Int(readLine()!)!  // Read number of elements in the array
let arr = readLine()!.split(separator: " ").map { Int($0)! }  // Read the array

func getLastDigit(_ num: Int) -> Character? {
  return String(num).last
}

func divisible(_ array: [Int]) {
  var target = ""
  for num in array {
    if let lastDigit = getLastDigit(num) {
      target.append(lastDigit)
    }
  }
  return print((Int(target) ?? 0) % 10 == 0 ? "YES" : "NO")
}
