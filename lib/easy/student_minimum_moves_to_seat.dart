int studentMinimumMovesToSeat(List<int> seats, List<int> students) {
  seats.sort();
  students.sort();
  int counter = 0;
  return seats.fold(0, (acc, seat) => acc + (seat - students[counter++]).abs());
}
