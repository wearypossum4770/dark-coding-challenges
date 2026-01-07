package medium;
public class RepeatedStringMatch {
public int solve(String a, String b) {
	int count = 1;
	String sb = a;
	while( sb.length() < b.length()) {
		count++;
		sb += a;
	}
	if(sb.contains(b)) return count;
	sb += a;
	if(sb.contains(b)) return count + 1; 
return -1;
}}