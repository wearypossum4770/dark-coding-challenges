func maskPhone(_ phone: String) -> String {
  var digits = [Character]()
  var i = phone.index(before: phone.endIndex)
  var chars = 0
  var count = 0
  while i >= phone.startIndex {
    if phone[i].isNumber {
      if count == 4 || count == 8 || count == 12 {
        count += 1
        digits.append("-")
      }
      if count <= 4 {
        digits.append(phone[i])
      } else {
        digits.append("*")
      }
      count += 1
      chars += 1
    }
    if i == phone.startIndex {
      break
    }
    i = phone.index(before: i)
  }
  if chars > 10 {
    digits.append("+")
  }
  return String(digits.reversed())
}

func maskEmail(_ email: String) -> String {
  guard let atIndex = email.firstIndex(of: "@") else {
    return email.lowercased()
  }
  let first = email[email.startIndex]
  let last = email[email.index(before: atIndex)]
  let domain = email[atIndex...]
  return "\(first)*****\(last)\(domain)".lowercased()
}
func maskingPersonallyIdentifiableInformation(_ s: String) -> String {
  if s.contains("@") {
    return maskEmail(s)
  }
  return maskPhone(s)
}
