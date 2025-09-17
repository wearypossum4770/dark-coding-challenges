String intToFizzBuzz(int n) {
  if (n % 15 == 0) return "FizzBuzz";
  if (n % 5 == 0) return "Buzz";
  if (n % 3 == 0) return "Fizz";
  return n.toString();
}

List<String> fizzBuzz(int n) {
  List<String> result = List.filled(n, "");
  for (int i = 0; i < n; i++) {
    result[i] = intToFizzBuzz(i + 1);
  }
  return result;
}
