func profitableGamble(_ prob: Float, _ prize: Float, _ pay: Float) -> Bool {
  return (prob * prize) - pay > 0
}
