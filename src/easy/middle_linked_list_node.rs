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
#[cfg(test)]
mod tests {
    use crate::helpers::linked_list::ListNode;

    use super::middle_linked_list_node;
    use rstest::rstest;
    #[rstest]
    #[case(vec![1,2,3,4,5], vec![3,4,5])]
    #[case(vec![1,2,3,4,5,6], vec![4,5,6])]
    fn test_middle_linked_list_node(#[case] input: Vec<i32>, #[case] output: Vec<i32>) {
        let head = ListNode::from_vec(&input);
        let outcome = middle_linked_list_node(head);
        let expected = ListNode::to_vec(&outcome);
        assert_eq!(output, expected);
    }
}
