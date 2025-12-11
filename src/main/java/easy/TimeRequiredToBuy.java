package easy;

import java.util.ArrayList;
import java.util.List;

class Person {
  int vouchers;
  int position;
  boolean isOriginal;

  public Person(int index, int value, int k) {
    vouchers = value;
    position = index;
    isOriginal = index == k;
  }

  public void purchaseTicket() {
    if (vouchers > 0) {
      vouchers--;
    }
  }
}

public class TimeRequiredToBuy {
  public int solve(int[] tickets, int k) {
    int time = 0;
    List<Person> queue = new ArrayList<>();
    for (int i = 0; i < tickets.length; i++) {
      queue.add(new Person(i, tickets[i], k));
    }
    while (!queue.isEmpty()) {
      Person person = queue.remove(0);
      if (person.vouchers > 0) {
        person.purchaseTicket();
        time++;
      }
      if (person.isOriginal && person.vouchers == 0) break;
      if (person.vouchers > 0) queue.add(person);
    }
    return time;
  }
}
