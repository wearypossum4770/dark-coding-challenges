package easy
import utilities.KodeeTreeNode
import kotlin.math.min

fun <T> kodeeMinimumDepthBinaryTree(root: KodeeTreeNode<T?>?): Int {
    if (root == null) return 0
    val left = root.left
    val right = root.right
    if (left == null && right == null) return 1
    if (left == null) return 1 + kodeeMinimumDepthBinaryTree(right)
    if (right == null) return 1 + kodeeMinimumDepthBinaryTree(left)
    return 1 + min(kodeeMinimumDepthBinaryTree(left), kodeeMinimumDepthBinaryTree(right))
}
