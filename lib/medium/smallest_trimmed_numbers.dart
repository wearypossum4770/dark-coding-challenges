class Rank {
  int index;
  String value;
  Rank(this.index, this.value);
  int getIndex() {
    return index;
  }

  String getValue() {
    return value;
  }
}

List<int> smallestTrimmedNumbers(List<String> nums, List<List<int>> queries) {
  List<int> result = List.filled(queries.length, 0);
  for (int i = 0; i < queries.length; i++) {
    int rank = queries[i][0];
    int digit = queries[i][1];
    List<Rank> trimmed =
        nums.indexed.map((e) {
          final idx = e.$1;
          final val = e.$2;
          final start = (val.length - digit).clamp(0, val.length);
          return Rank(idx, val.substring(start));
        }).toList();
    trimmed.sort((Rank lhs, Rank rhs) {
      int cmp = lhs.value.compareTo(rhs.value);
      if (cmp != 0) return cmp;
      return lhs.index.compareTo(rhs.index);
    });
    result[i] = trimmed[rank - 1].index;
  }
  return result;
}
