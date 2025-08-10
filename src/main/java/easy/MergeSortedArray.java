package easy;

public class MergeSortedArray {
  public void mergeSortedArrayInPlace(int[] nums1, int m, int[] nums2, int n) {
    int k = m + n - 1;
    m--;
    n--;
    while(m >= 0 && n >= 0) {
      if (nums1[m] >= nums2[n]) {
        nums1[k] = nums1[m];
        m--;
      }else {
        nums1[k] = nums2[n];
        n--;
      }
      k--;
    }
    while(n >= 0) {
      nums1[k] = nums2[n];
      n--;
      k--;
    }
  }
  public int[] solve(int[] nums1, int m, int[] nums2, int n) {
    int[] result = new int[m + n];
    int k = 0;
    int i = 0;
    int j = 0;
    while( i < m && j < n) {
      if (nums1[i] <= nums2[j]) {
        result[k] = nums1[i];
        i++;
      }else {
        result[k] = nums2[j];
        j++;
      }
      k++;
    }
    while(i < m) {
      result[k] = nums1[i];
      i++;
      k++;
    }
    while(j < n) {
      result[k] = nums2[j];
      j++;
      k++;
    }
    return result;
  }
}
