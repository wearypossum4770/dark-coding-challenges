def can_be_prepared(recipe: str, ingredients: tuple[str, ...]) -> bool:
    if not recipe or not ingredients:
        return False
    outer = []
    inner = []
    for piece in recipe:
        if piece.isalpha():
            inner.append(piece)
        elif piece in "|(" and inner:
            outer.append(all([c in ingredients for c in inner]))
            inner = []
    if inner:
        outer.append(all([c in ingredients for c in inner]))
    return any(outer)
