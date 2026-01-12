package easy;

import java.util.HashMap;
import java.util.List;

public class RelativeSortArray {
    public int[] solve(int[] arr1, int[] arr2) {
        int[] result = new int[arr1.length];
        int index = 0;
        HashMap<Integer, Integer> freq = new HashMap<>();
        for (int i : arr1) {
            freq.put(i, freq.getOrDefault(i, 0) + 1);
        }
        for (int i : arr2) {
            int count = freq.getOrDefault(i, 0);
            while (count > 0) {
                result[index++] = i;
                count--;
            }
            freq.remove(i);
        }
        List<Integer> sorted = freq.keySet().stream().sorted().toList();
        for (int i : sorted) {
            int count = freq.getOrDefault(i, 0);
            while (count > 0) {
                count--;
                result[index++] = i;
            }
        }
        return result;
    }
}
