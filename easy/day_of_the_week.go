package easy

func DayOfTheWeek(day, month, year int) string {
	offset := []int{0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4}
	dayNames := []string{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
	if month < 3 {
		year -= 1
	}
	modifier := offset[month-1]
	index := year + year/4 - year/100 + year/400 + modifier + day
	return dayNames[index%7]
}
