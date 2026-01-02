package easy;
public class RotateString {
public boolean solve(String s, String goal) {
	if(s.length() != goal.length()) return false;
	return s.repeat(2).contains(goal);
}}