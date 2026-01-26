package easy
import KodeeTreeNode

fun kodeeIsSameTree(
    p: KodeeTreeNode<Int?>?,
    q: KodeeTreeNode<Int?>?,
): Boolean {
    if (p == null && q == null) return true
    if (p == null || q == null) return false
    if (p.`val` != q.`val`) return false
    return kodeeIsSameTree(p.left, q.left) && kodeeIsSameTree(p.right, q.right)
}
