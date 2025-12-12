class TicketCustomer {
  var tickets: Int
  let isOriginal: Bool
  init(_ index: Int, _ value: Int, _ k: Int) {
    tickets = value
    isOriginal = index == k
  }
  func purchaseTicket() {
    if tickets > 0 {
      tickets -= 1
    }
  }
}
func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
  var elapsedTime = 0
  var queue = tickets.enumerated().map { (offset: Int, element: Int) in
    TicketCustomer(offset, element, k)
  }
  while !queue.isEmpty {
    let person = queue.removeFirst()
    if person.tickets > 0 {
      person.purchaseTicket()
      elapsedTime += 1
    }
    if person.isOriginal && person.tickets == 0 {
      break
    }
    if person.tickets > 0 {
      queue.append(person)
    }
  }
  return elapsedTime
}
