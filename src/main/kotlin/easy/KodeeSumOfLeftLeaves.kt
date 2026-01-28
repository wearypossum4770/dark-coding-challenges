package easy
import utilities.KodeeTreeNode

fun <T> kodeeSumOfLeftLeaves(root: KodeeTreeNode<Int?>?): Int {
    var count = 0
    val stack = mutableListOf(root to false)

    while (stack.isNotEmpty()) {
        val (node, isLeft) = stack.removeAt(0)
        if (node?.left == null && node?.right == null && isLeft) {
            count += node?.`val` ?: 0
        }
        if (node?.left != null) stack.add(node.left to true)
        if (node?.right != null) stack.add(node.right to false)
    }
    return count
}
