package easy

fun <T> kodeeMiddleLinkedListNode(head: KodeeListNode<T?>?): KodeeListNode<T?>? {
    var slow = head
    var fast = head
    while (fast != null && fast.next != null) {
        slow = slow?.next
        fast = fast.next?.next
    }
    return slow
}
