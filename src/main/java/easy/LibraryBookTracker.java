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
  private final Map<String, List<Inventory>> inventories = new HashMap<>();
  private final List<Integer> dueOuts = new ArrayList<>();

  public void restock() {
    try {
      throw new Exception("not implemented");
    } catch (Exception e) {
      // TODO: handle exception
    }
  }

  public void purchase() {
    try {
      throw new Exception("not implemented");
    } catch (Exception e) {
      // TODO: handle exception
    }
  }

  public void refurbish() {
    try {
      throw new Exception("not implemented");
    } catch (Exception e) {
      // TODO: handle exception
    }
  }

  public void acquisition(String category, int quantity, int price) {
    List<Inventory> inventory = this.inventories.computeIfAbsent(category, k -> new ArrayList<>());

    inventory.add(new Inventory(quantity, price));
  }

  public void checkout(String category, int quantity) {
    List<Inventory> inventory = this.inventories.computeIfAbsent(category, k -> new ArrayList<>());
    if (inventory.isEmpty()) return;
    Collections.sort(inventory);
    int remaining = quantity;
    int checkedOut = 0;
    for (Inventory book : inventory) {
      if (book.isEmpty()) continue;
      int before = book.getQuantity();

      remaining = book.remove(remaining);
      int removed = before - book.getQuantity();
      checkedOut += removed * book.getPrice();
      if (remaining == 0) break;
    }
    dueOuts.add(checkedOut);
  }

  public void reclassify(String category, int quantity, int previousPrice, int nextPrice) {
    List<Inventory> inventory = this.inventories.get(category);
    if (inventory == null || inventory.isEmpty()) return;
    List<Inventory> original = new ArrayList<>(inventory);
    int remaining = quantity;
    for (Inventory book : original) {
      if (book.getPrice() != previousPrice) continue;
      if (remaining <= 0) break;
      if (book.getQuantity() <= remaining) {
        book.setPrice(nextPrice);
        remaining -= book.getQuantity();
      } else {
        int split = remaining;
        book.setQuantity(book.getQuantity() - split);
        inventory.add(new Inventory(split, nextPrice));
        remaining = 0;
      }
    }
  }

  public static int parseIntOrDefault(String s, int defaultValue) {
    try {
      return Integer.parseInt(s);
    } catch (NumberFormatException | NullPointerException e) {
      return defaultValue;
    }
  }

  public int[] solve(String[][] operations) {
    for (String[] op : operations) {
      String action = op[0];
      String category = op[1];
      int quantity = parseIntOrDefault(op[2], 0);
      int prevPrice = op.length > 3 ? parseIntOrDefault(op[3], 0) : 0;
      int nextPrice = op.length > 4 ? parseIntOrDefault(op[4], 0) : 0;
      switch (action) {
        case "acquisition" -> acquisition(category, quantity, parseIntOrDefault(op[3], 0));
        case "restock" -> restock();
        case "purchase" -> purchase();
        case "refurbish" -> refurbish();
        case "checkout" -> checkout(category, quantity);
        case "reclassify" -> reclassify(category, quantity, prevPrice, nextPrice);
      }
    }
    return dueOuts.stream().mapToInt(Integer::intValue).toArray();
  }

  public int getBookCount() {
    int count = 0;
    for (Map.Entry<String, List<Inventory>> entry : inventories.entrySet()) {
      for (Inventory book : entry.getValue()) {
        count += book.getQuantity();
      }
    }
    return count;
  }
}
