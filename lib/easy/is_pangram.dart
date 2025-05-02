final String alphabet = "abcdefghijklmnopqrstuvwxyz";
final alpha = RegExp(r"[a-zA-Z]+");
bool isPangram(String text) {
  Set<String> letters = Set.from(text.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '').split(''));
  return letters.length == 26;
}
