package easy

fun kodeeRotateString(
    s: String,
    goal: String,
): Boolean {
    if (s.length != goal.length) return false

    return s.repeat(2).contains(goal)
}
