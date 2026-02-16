package easy
import KodeeTreeNode

fun <T> checkMirror(
    left: KodeeTreeNode<T?>?,
    right: KodeeTreeNode<T?>?,
): Boolean {
    if (left == null && right == null) return true
    if (left == null || right == null) return false
    return left.`val` == right.`val` && checkMirror(left.left, right.right) && checkMirror(left.right, right.left)
}

fun <T> kodeeIsTreeSymmetric(root: KodeeTreeNode<T?>?): Boolean {
    if (root == null) return true
    return checkMirror(root.left, root.right)
}
