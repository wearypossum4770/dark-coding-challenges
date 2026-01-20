package easy

import KodeeTreeNode

fun <T> kodeePreOrderTraversal(root: KodeeTreeNode<T?>?): List<T> {
    var result = mutableListOf<T>()
    var stack = ArrayDeque<KodeeTreeNode<T?>?>()
    root?.let { stack.addLast(it) }

    while (stack.isNotEmpty()) {
        val current = stack.removeLast()
        current?.`val`?.let { result.add(it) }
        current?.right?.let { stack.addLast(it) }
        current?.left?.let { stack.addLast(it) }
    }
    return result
}
