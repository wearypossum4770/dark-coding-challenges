package easy;

public class DayOfTheWeek {
  public String solve(int day, int month, int year) {
    int[] offset = new int[] {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
    String[] dayNames =
        new String[] {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
    int modifier = offset[month - 1];
    if (month < 3) {
      year -= 1;
    }
    int index = year + year / 4 - year / 100 + year / 400 + modifier + day;
    return dayNames[index % 7];
  }
}
