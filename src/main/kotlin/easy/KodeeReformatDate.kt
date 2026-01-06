package easy
fun kodeeReformatDate(date: String): String  {
	val months = arrayOf("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
	val parts = date.split(" ")
	val month = months.indexOf(parts[1]) + 1
	var day = 0
	for(char in parts[0]) {
		if(char.isDigit()) {
			day = day * 10 + char.digitToInt()
		}
	}
	return String.format("%s-%02d-%02d", parts[2], month, day)
}