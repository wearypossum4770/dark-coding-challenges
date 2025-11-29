func dayOfTheWeek(_ day: Int, _ month: Int, _ year: Int) -> String {
  var m = month
  var y = year
  if m < 3 {
    m += 12
    y -= 1
  }

  let k = y % 100
  let j = y / 100

  let h =
    (day
      + (13 * (m + 1)) / 5
      + k
      + (k / 4)
      + (j / 4)
      + (5 * j)) % 7

  let names = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

  return names[h]
}
