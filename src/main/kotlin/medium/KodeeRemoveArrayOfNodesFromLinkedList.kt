package medium
import easy.KodeeListNode

fun kodeeRemoveArrayOfNodesFromLinkedList(
    nums: IntArray,
    head: KodeeListNode<Int>?,
): KodeeListNode<Int>? {
    val unique = nums.toSet()
    var dummy = KodeeListNode(0)
    dummy.next = head
    var current = dummy
    while (current.next != null) {
        if (unique.contains(current.next?.`val`)) {
            current.next = current.next?.next
        } else {
            current = current?.next ?: break
        }
    }
    return dummy.next
}
