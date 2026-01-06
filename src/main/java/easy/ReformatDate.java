package easy;
public class ReformatDate {
	String[] months = new String[]{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
public String solve(String date) {
	String[] parts = date.split(" ");
	int month = 1;
	int day = 0;
	for(int i = 0; i < months.length; i++) {
		if(months[i].equals(parts[1]))  {
			month += i;
		}
	}
	for(char c: parts[0].toCharArray()) {
		
		if(Character.isDigit(c)) {
			day = day * 10 + Character.digit(c, 10);
		}
	}
return String.format("%s-%02d-%02d", parts[2], month, day);
}}