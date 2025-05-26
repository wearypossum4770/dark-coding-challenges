func acceptIntoMovie(_ age: Float, _ isSupervised: Bool) -> Bool {
  if age >= 15 { return true }
  return isSupervised
}
