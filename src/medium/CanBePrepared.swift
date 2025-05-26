func canBePrepared(_ recipes: String, _ ingredients: [String]) -> Bool {
  var outer: [Bool] = []
  var inner: [Character] = []
  for piece: Character in recipes {
    switch piece { case "|":
      outer.append(inner.allSatisfy { ingredients.contains("\($0)") })
      inner.removeAll()
      case "A"..."Z": inner.append(piece)
      default: continue
    }
  }
  if !inner.isEmpty { outer.append(inner.allSatisfy { ingredients.contains("\($0)") }) }
  return outer.contains(true)
}
