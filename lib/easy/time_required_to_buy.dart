import 'package:collection/collection.dart';

class Person {
  int tickets;
  bool isOriginal;
  Person(this.tickets, this.isOriginal);
  void purchaseTicket() {
    if (tickets > 0) {
      tickets--;
    }
  }
}

int timeRequiredToBuy(List<int> tickets, int k) {
  int elapsedTime = 0;
  List<Person> queue = tickets.mapIndexed((index, value) => Person(value, index == k)).toList();
  while (queue.isNotEmpty) {
    Person person = queue.removeAt(0);
      elapsedTime++;
      person.purchaseTicket();
    if (person.tickets == 0 && person.isOriginal) break;
    if (person.tickets > 0) queue.add(person);
  }
  return elapsedTime;
}