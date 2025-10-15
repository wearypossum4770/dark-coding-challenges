package medium
import easy.KodeeListNode

fun <T> kodeeDeleteLinkedListNode(node: KodeeListNode<T>?) {
    if (node == null || node.next == null) return
    node.`val` = node.next?.`val`
    node.next = node.next?.next
}
