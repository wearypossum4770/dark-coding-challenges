func maximumManhattanDistance(_ direction: String, _ k: Int)-> Int {
    var location = [0, 0]
    var total = 0
    for char in direction {
        switch char {
        case "N" | "n":
            location[1] += k
        case "S" | "s":
            location[1] -= k
        case "W" | "w":
            location[0]
        default:
            continue
        }
    }
}