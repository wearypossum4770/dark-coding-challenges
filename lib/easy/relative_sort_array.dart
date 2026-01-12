List<int> relativeSortArray(List<int> arr1, List<int> arr2) {
  List<int> result = List.filled(arr1.length, 0);
  List<int> freq = List.filled(1_001, 0);
  int index = 0;
  for(int num in arr1) {
    freq[num]++;
  }
  for(int num in arr2) {
    while(freq[num] > 0) {
      freq[num]--;
      result[index++] = num;
    }
  }
  for(int i = 0; i < freq.length; i++) {
    while(freq[i]-- > 0)  {
      result[index++] = i;
      
    }
  }
  return result;
}
