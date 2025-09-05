package easy;

public class ReplaceGreatestElements {
  public int[] solve(int[] arr) {
    int max = -1;
    int right = arr.length - 1;
    while (right >= 0) {
      int temp = arr[right];
      arr[right] = max;
      if (temp > max) {
        max = temp;
      }
      right--;
    }
    return arr;
  }
}
