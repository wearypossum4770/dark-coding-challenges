use std::collections::HashSet;

use crate::helpers::linked_list::ImprovedListNode;

pub fn remove_array_of_nodes_from_linked_list(
    nums: Vec<i32>,
    head: Option<Box<ImprovedListNode>>,
) -> Option<Box<ImprovedListNode>> {
    let unique: HashSet<i32> = HashSet::from_iter(nums);
    let mut dummy = Box::new(ImprovedListNode::new(0));
    dummy.next = head;
    let mut current = &mut dummy;
    while let Some(ref mut node) = current.next {
        if unique.contains(&node.val) {
            current.next = node.next.take();
        } else {
            current = current.next.as_mut().unwrap();
        }
    }
    dummy.next
}