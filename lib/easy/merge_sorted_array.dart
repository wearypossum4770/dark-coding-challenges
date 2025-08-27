void mergeSortedArrayInPlace(List<int> nums1, int m, List<int> nums2, int n) {
  int k = m + n - 1;
  m--;
  n--;
  while (m >= 0 && n >= 0) {
    if (nums1[m] >= nums2[n]) {
      nums1[k] = nums1[m];
      m--;
    } else {
      nums1[k] = nums2[n];
      n--;
    }
    k--;
  }
  while (n >= 0) {
    nums1[k] = nums2[n];
    n--;
    k--;
  }
}

List<int> mergeSortedArray(List<int> nums1, int m, List<int> nums2, int n) {
  var result = List.filled(m + n, 0, growable: false);
  int i = 0;
  int j = 0;
  int k = 0;
  while (i < m && j < n) {
    if (nums1[i] <= nums2[j]) {
      result[k] = nums1[i];
      i++;
    } else {
      result[k] = nums2[j];
      j++;
    }
    k++;
  }
  while (i < m) {
    result[k] = nums1[i];
    i++;
    k++;
  }
  while (j < n) {
    result[k] = nums2[j];
    j++;
    k++;
  }

  return result;
}
