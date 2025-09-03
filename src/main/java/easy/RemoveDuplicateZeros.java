package easy;

public class RemoveDuplicateZeros {
  public void duplicateZeros(int[] arr) {
    if (arr == null || arr.length == 0) return;
    for (int left = 0; left < arr.length; left++) {
      if (arr[left] == 0) {
        for (int right = arr.length - 1; right > left; right--) {
          arr[right] = arr[right - 1];
        }
        left++;
      }
    }
    System.gc();
  }

  public void solve(int[] nums) {
    this.duplicateZeros(nums);
  }
}
