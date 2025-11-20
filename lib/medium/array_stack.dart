List<String> arrayStack(List<int> target, int n) {
    List<String> result = [];
    int index = 0;
    int counter = 1;
    while (index < target.length) {
      result.add("Push");
      if (target[index] == counter) {
        index++;
      } else {
        result.add("Pop");
      }
      counter++;
    }
    return result;
}
