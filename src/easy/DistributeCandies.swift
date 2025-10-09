func distributeCandies(_ candyType: [Int]) -> Int {
    let stop = candyType.count / 2
    var unique = Set<Int>()
    for candy in candyType {
        if unique.count < stop {
        unique.insert(candy)
        }
        else { return stop }
    }
    return unique.count
}
