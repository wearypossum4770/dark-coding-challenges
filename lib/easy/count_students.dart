int countStudents(List<int> students, List<int> sandwiches) {
  int rotations = 0;

  while (students.isNotEmpty && sandwiches.isNotEmpty) {
    if (rotations == students.length) break;
    if (students.first == sandwiches.first) {
      students.removeAt(0);
      sandwiches.removeAt(0);
      rotations = 0;
    } else {
      students.add(students.removeAt(0));
      rotations++;
    }
  }
  return students.length;
}
