import Foundation
import helpers

func romanToInt(roman: String) -> Int {
  var total = 0
  var index = roman.startIndex
  let romanNumerals = Utilities.romanNumeralsToArabic

  while index < roman.index(before: roman.endIndex) {
    let current = romanNumerals[roman[index], default: 0]
    let nextIndex = roman.index(after: index)
    let next = romanNumerals[roman[nextIndex], default: 0]
    if current < next {
      total -= current
    } else {
      total += current
    }
    index = nextIndex
  }
  return total + romanNumerals[roman[roman.index(before: roman.endIndex)], default: 0]
}
