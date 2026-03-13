import 'dart:math';

int findLargestAltitude(List<int> gain) {
  List<int> result = List.filled(gain.length + 1, 0);
  int altitude = 0;
  for (int i = 0; i < gain.length; i++) {
    result[i] = gain[i] + altitude;
    altitude += gain[i];
  }
  return result.reduce(max);
}
