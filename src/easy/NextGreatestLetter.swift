func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
  for c in letters {
    if target < c {
      return c
    }
  }
  return letters[0]
}
