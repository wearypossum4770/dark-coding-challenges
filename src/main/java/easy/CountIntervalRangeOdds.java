package easy;
public class CountIntervalRangeOdds {
public int  solve(int low, int high) {
	int correction = 0;
	if(low % 2 != 0 && high % 2 != 0) {
		correction = 1;
	}
	return Math.floorDiv(high + 1 - low, 2) + correction;
}}
