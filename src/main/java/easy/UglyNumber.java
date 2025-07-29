package easy;

public class UglyNumber {
  public boolean isUgly(int n) {
    if (n <= 0) return false;
    int num = n;
    int[] primes = new int[] {2, 3, 5};
    for (Integer prime : primes) {
      while (num % prime == 0) {
        num /= prime;
      }
    }
    return num == 1;
  }

  public boolean solve(int n) {
    return isUgly(n);
  }
}

// rm test/easyswift/UglyNumberTest.swift
// rm src/easy/UglyNumber.swift
// rm src/easy/ugly_number.zig
// rm src/easy/ugly_number.rs
// rm easy/ugly_number_test.go
// rm easy/ugly_number.go
// rm test/easy/UglyNumberTest.php
// rm src/main/php/Easy/UglyNumber.php
// rm test/easy/ugly_number_test.dart
// rm lib/easy/ugly_number.dart
// rm test/easy/ugly-number.test.ts
// rm src/easy/ugly-number.ts
// rm src/test/java/easy/UglyNumberTest.java
// rm src/main/java/easy/UglyNumber.java
// rm src/test/kotlin/easy/KodeeUglyNumberTest.kt
// rm src/main/kotlin/easy/KodeeUglyNumber.kt
// rm easy/test_ugly_number.py
// rm easy/ugly_number.py
