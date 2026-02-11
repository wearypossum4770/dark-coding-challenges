package easy
import KodeeTreeNode

fun <T> kodeeLevelOrderTraversal(root: KodeeTreeNode<T>?): List<List<T>> {
    var result = mutableListOf<List<T>>()
    if (root == null) return result
    val queue = mutableListOf<KodeeTreeNode<T>>()
    queue.add(root)
    while (queue.isNotEmpty()) {
        val size = queue.size
        val current = mutableListOf<T>()
        repeat(size) {
            val node = queue.removeAt(0)
            node.let {
                current.add(node.`val`)
                it.left?.let { queue.add(it) }
                it.right?.let { queue.add(it) }
            }
        }
        if (current.isNotEmpty()) result.add(current)
    }
    return result
}
