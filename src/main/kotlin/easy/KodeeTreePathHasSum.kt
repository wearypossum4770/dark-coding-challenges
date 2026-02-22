package easy
import KodeeTreeNode

fun kodeeTreePathHasSum(
    root: KodeeTreeNode<Int?>?,
    targetSum: Int,
): Boolean {
    if (root == null) return false
    if (root.`val` == targetSum) return true
    val value = root.`val`
    if (value == null) return false
    val remainder = targetSum - value
    return kodeeTreePathHasSum(root.left, remainder) || kodeeTreePathHasSum(root.right, remainder)
}
