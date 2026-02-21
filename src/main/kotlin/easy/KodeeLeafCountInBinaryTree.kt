package easy
import KodeeTreeNode

fun kodeeLeafCountInBinaryTree(root: KodeeTreeNode<Int?>?): Int {
    if (root == null) return 0
    if (root.left == null || root.right == null) return 1
    return kodeeLeafCountInBinaryTree(root.left) + kodeeLeafCountInBinaryTree(root.right)
}
