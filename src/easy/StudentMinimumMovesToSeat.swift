func studentMinimumMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
  let sortedStudents = students.sorted()

  return seats.sorted().enumerated().reduce(0) { acc, pair in
    let (i, seat) = pair
    return acc + abs(seat - sortedStudents[i])
  }
}
