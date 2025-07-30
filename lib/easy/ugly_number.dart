bool uglyNumber(num n) {
  if (n < 1) return false;
  List<num> primes = [2, 3, 5];
  for (var prime in primes) {
    while (n % prime == 0) {
      n ~/= prime;
    }
  }
  return n == 1;
}
