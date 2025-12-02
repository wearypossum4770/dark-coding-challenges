List<String> daysNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

String dayOfTheWeek(int day, int month, int year) {
  List<int> offset = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
  if (month < 3) {
    year -= 1;
  }
  return daysNames[(year + year ~/ 4 - year ~/ 100 + year ~/ 400 + offset[month - 1] + day) % 7];
}
