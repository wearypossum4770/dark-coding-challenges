int romanToInt(String romanNumeral) {
  final Map<String, int> romanMap = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000,
  };
  int total = 0;
  int prev = 0;

  for (int i = romanNumeral.length - 1; i >= 0; i--) {
    int curr = romanMap[romanNumeral[i]] ?? 0;
    
    if (curr < prev) {
      total -= curr; 
    } else {
      total += curr; 
    }

    prev = curr;
  }

  return total;
}
