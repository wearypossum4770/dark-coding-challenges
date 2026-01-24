use crate::helpers::linked_list::ListNode;

pub fn middle_linked_list_node<T>(head: Option<Box<ListNode<T>>>) -> Option<Box<ListNode<T>>>
where
    T: Clone + std::cmp::PartialEq,
{
    let mut fast = &head;
    let mut slow = &head;

    while let Some(s) = fast {
        if let Some(f) = &s.next {
            fast = &f.next;
            slow = &slow.as_ref().unwrap().next;
        } else {
            break;
        }
    }
    slow.clone()
}
