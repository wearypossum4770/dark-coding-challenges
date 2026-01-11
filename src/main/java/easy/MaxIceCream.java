package easy;

import java.util.Arrays;

public class MaxIceCream {
    public int solve(int[] costs, int coins) {
        int cones = 0;
        Arrays.sort(costs);
        for (int i : costs) {
            if (coins >= i) {
                coins -= i;
                cones++;
            }
        }
        return cones;
    }
}
