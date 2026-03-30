namespace Easy;

using DataStructures;

/// <summary>
/// Determines whether a singly linked list contains a cycle.
/// </summary>
public class HasCycle
{
    /// <summary>
    /// Uses Floyd's cycle detection algorithm (tortoise and hare) to detect
    /// whether the given linked list contains a cycle. A slow pointer advances
    /// one node at a time while a fast pointer advances two nodes at a time.
    /// If they ever point to the same node, a cycle exists.
    /// </summary>
    /// <param name="head">The head node of the linked list, or null if the list is empty.</param>
    /// <returns>True if the linked list contains a cycle; otherwise, false.</returns>
    public static bool Solve(ListNode? head)
    {
        if (head == null)
            return false;
        ListNode? fast = head;
        ListNode? slow = head;
        while (fast != null && fast.next != null)
        {
            slow = slow?.next;
            fast = fast?.next?.next;
            if (slow == fast)
                return true;
        }

        return false;
    }
}
