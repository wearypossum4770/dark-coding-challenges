package easy

fun kodeeMinDeletionSize(strs: Array<String>): Int {
    var count = 0
    val rows = strs.size
    val cols = strs[0].length

    for (col in 0..<cols) {
    var row = 1
    while(row < rows) {
        if(strs[row - 1][col] > strs[row][col]) {
            count++
            break;
        }
            row++
    }
 
    }
    return count
}
