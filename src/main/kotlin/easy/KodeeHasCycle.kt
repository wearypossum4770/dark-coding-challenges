package easy

fun <T> kodeeHasCycle(head: KodeeListNode<T>?): Boolean {
    var fast = head
    var slow = head
    while (fast != null && fast.next != null) {
        fast = fast?.next?.next
        slow = slow?.next
        if (fast === slow) {
            return true
        }
    }
    return false
}
