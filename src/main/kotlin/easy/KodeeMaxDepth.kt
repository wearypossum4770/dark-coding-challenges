package easy
import KodeeTreeNode
import kotlin.math.max

fun kodeeMaxDepth(root: KodeeTreeNode<Int?>?): Int {
    if (root == null) return 0
    return max(kodeeMaxDepth(root.left), kodeeMaxDepth(root.right)) + 1
}
