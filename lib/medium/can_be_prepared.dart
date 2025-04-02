bool canBePrepared(String recipe, List<int> ingredients) {
  if (recipe.isEmpty || ingredients.isEmpty) return false;
  List<bool> outer = [];
  List<int> inner = [];
  for (var piece in recipe.runes) {
    if ((piece >= 65 && piece <= 90) || (piece >= 97 && piece <= 122)) {
      inner.add(piece);
    } else if ("|(".runes.contains(piece) && inner.isNotEmpty) {
      outer.add(inner.every((c) => ingredients.contains(c)));
      inner = [];
    }
  }
  if (inner.isNotEmpty) {
    outer.add(inner.every((c) => ingredients.contains(c)));
  }
  return outer.contains(true);
}
