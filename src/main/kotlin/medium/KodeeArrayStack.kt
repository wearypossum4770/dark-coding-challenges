package medium

fun kodeeArrayStack(
    target: IntArray,
    n: Int,
): List<String> {
    var result = mutableListOf<String>()
    var index = 0
    var counter = 1
    while (index < target.size) {
        result.add("Push")
        if (target[index] == counter) {
            index++
        } else {
            result.add("Pop")
        }
        counter++
    }
    return result
}
