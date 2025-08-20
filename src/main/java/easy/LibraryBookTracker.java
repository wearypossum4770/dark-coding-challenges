package easy;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class Inventory implements Comparable<Inventory> {
  int quantity;
  int price;

  @Override
  public int compareTo(Inventory other) {
    return Double.compare(this.price, other.price);
  }

  public Inventory(int quantity, int price) {
    this.quantity = quantity;
    this.price = price;
  }

  public int getQuantity() {
    return quantity;
  }

  public boolean notEmpty() {
    return this.quantity > 0;
  }

  public boolean isEmpty() {
    return this.quantity == 0;
  }

  public int remove(int quantity) {
    if (this.quantity < quantity) {
			int remaining = quantity - this.quantity;
      this.quantity = 0;
      return remaining;
    }
    this.quantity -= quantity;
    return 0;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public int getPrice() {
    return price;
  }

  @Override
  public String toString() {
    return String.format("quantity: %d, price %d", quantity, price);
  }
}

public class LibraryBookTracker {
  Map<String, List<Inventory>> inventories = new HashMap<>();

  public void acquisition(String category, int quantity, int price) {
    List<Inventory> inventory = this.inventories.computeIfAbsent(category, k -> new ArrayList<>());

    inventory.add(new Inventory(quantity, price));
  }

  public void printInventories() {
    for (Map.Entry<String, List<Inventory>> entry : inventories.entrySet()) {
      System.out.println("Category: " + entry.getKey());
      for (Inventory item : entry.getValue()) {
        System.out.println(String.format("\t %s", item));
      }
    }
  }

  public void checkout(String category, int quantity) {
    List<Inventory> inventory = this.inventories.computeIfAbsent(category, k -> new ArrayList<>());
    if (inventory.isEmpty()) return;
    Collections.sort(inventory);
    int remaining = quantity;
    for (Inventory book : inventory) {
      if (book.isEmpty()) continue;
      remaining = book.remove(remaining);
      if (remaining == 0) break;
    }
  }

  public void reclassify(String category, int quantity, int previousPrice, int updatedPrice) {
	List<Inventory> inventory = this.inventories.get(category);
	if (inventory == null || inventory.isEmpty()) return ;
	List<Inventory> original = new ArrayList<>(inventory);
		int remaining = quantity;
		for (Inventory book: original) {
			if (book.getPrice() != previousPrice) continue;
			if (remaining <= 0) break;
			if (book.getQuantity() <= remaining) {
				book.setPrice(updatedPrice);
				remaining -= book.getQuantity();
			} else {
				int split = remaining;
				book.setQuantity(book.getQuantity() - split);
				inventory.add(new Inventory(split, updatedPrice));
				remaining = 0;
			}
		}
		
	}

  public int[] solve(String[][] operations) {
    List<Integer> inventory = new ArrayList<>();
		for (String[] op: operations) {
					String category = op[1];
					int quantity = Integer.parseInt(op[1]);
					int price = Integer.parseInt(op[2]);
			switch(op[0]) {
				case "acquisition" -> acquisition(category, quantity, price);
			}
		}
	return inventory.stream().mapToInt(Integer::intValue).toArray();
  }
}
