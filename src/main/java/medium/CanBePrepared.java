package medium;

import java.util.ArrayList;
import java.util.List;

public class CanBePrepared {
  List<Boolean> outer = new ArrayList<>();
  List<Character> inner = new ArrayList<>();

  public boolean recipeHasAllIngredients(String recipe, List<Character> ingredients) {

    for (char c : recipe.toCharArray()) {
      switch (c) {
        case ('|' | '(') -> {
          if (!inner.isEmpty()) {
            outer.add(inner.stream().allMatch(ingredients::contains));
            inner.clear();
          }
        }
        default -> {
          if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
            inner.add(c);
          }
        }
      }
    }
    if (!inner.isEmpty()) {
      outer.add(inner.stream().allMatch(ingredients::contains));
    }
    return outer.stream().anyMatch(b -> b);
  }

  public boolean solve(String recipe, List<Character> ingredients) {
    return recipeHasAllIngredients(recipe, ingredients);
  }
}
