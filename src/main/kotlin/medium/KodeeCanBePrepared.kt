package medium

fun kodeeCanBePrepared(
    recipe: String,
    ingredients: List<Char>,
): Boolean {
    if (recipe.isEmpty() || ingredients.isEmpty()) return false
    val outer = mutableListOf<Boolean>()
    val inner = mutableListOf<Char>()
    for (c in recipe) {
        when {
            c == '(' || c == '|' -> {
                if (inner.isNotEmpty()) {
                    outer.add(inner.all { it in ingredients })
                    inner.clear()
                }
            }

            c.isLetter() -> {
                inner.add(c)
            }
        }
    }
    if (inner.isNotEmpty()) {
        outer.add(inner.all { it in ingredients })
    }
    return outer.any { it }
}
