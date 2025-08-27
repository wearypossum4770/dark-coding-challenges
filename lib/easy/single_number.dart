int singleNumber(List<int> values) {
  return values.reduce((a, b) => a ^ b);
}
