// https://edabit.com/challenge/XGmF8GiGwbWBSGCo6
func rectangleArea(_ height: Int, _ width: Int) -> Int {
  if height < 1 || width < 1 {
    return -1
  }
  return height * width
}
