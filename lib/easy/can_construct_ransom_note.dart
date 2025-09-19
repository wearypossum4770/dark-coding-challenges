const int aCode = 97;

bool canConstructRansomNote(String ransomNote, String magazine) {
  var freq = List.filled(26, 0);

  for (var char in magazine.toLowerCase().runes) {
    if (char >= 'a'.codeUnitAt(0) && char <= 'z'.codeUnitAt(0)) {
      freq[char - aCode]++;
    }
  }

  for (var char in ransomNote.toLowerCase().runes) {
    if (char >= 'a'.codeUnitAt(0) && char <= 'z'.codeUnitAt(0)) {
      freq[char - aCode]--;
      if (freq[char - aCode] < 0) return false;
    }
  }

  return true;
}
