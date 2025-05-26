func arrayFirstAndLastItem<T>(_ arr: [T]) -> [T]? {
  guard let first = arr.first, let last = arr.last else { return nil }
  return [first, last]
}
