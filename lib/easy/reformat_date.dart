String reformatDate(String date) {
  List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  List<String> parts = date.split(" ");
  int day = 0;
  for (final char in parts[0].codeUnits) {
    if (char >= 48 && char <= 57) {
      day = day * 10 + (char - 48);
    }
  }
  return "${parts[2]}-${(months.indexOf(parts[1]) + 1).toString().padLeft(2, "0")}-${day.toString().padLeft(2, "0")}";
}
