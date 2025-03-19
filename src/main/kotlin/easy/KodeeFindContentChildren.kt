package easy

fun kodeeFindContentChildren(
    children: IntArray,
    cookies: IntArray,
): Int {
    children.sort()
    cookies.sort()
    var i = 0
    var j = 0
    while (i < children.size && j < cookies.size) {
        if (cookies[j] >= children[i]) {
            i += 1
        }
        j += 1
    }
    return i
}
