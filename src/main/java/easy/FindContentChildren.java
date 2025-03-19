package easy;

import java.util.Arrays;

public class FindContentChildren {

  public int findContentChildren(int[] children, int[] cookies) {
    Arrays.sort(children);
    Arrays.sort(cookies);
    int i = 0;
    int j = 0;
    int content = 0;
    while (i < children.length && j < cookies.length) {
      if (cookies[j] >= children[i]) {
        content++;
        i++;
      }
      j += 1;
    }
    return content;
  }

  public int solve(int[] children, int[] cookies) {

    return this.findContentChildren(children, cookies);
  }
}
