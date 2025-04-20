#[derive(PartialEq, Eq, Clone, Debug)]
pub struct ListNode {
    pub val: i32,
    pub next: Option<Box<ListNode>>,
}
#[derive(PartialEq, Eq, Clone, Debug)]
pub struct GenericListNode<T> {
    pub val: T,
    pub next: Option<Box<GenericListNode<T>>>,
}

impl ListNode {
    pub fn new() -> Self {
        ListNode { val: 0, next: None }
    }
    pub fn create(val: i32) -> ListNode {
        ListNode { val, next: None }
    }
    pub fn set_value(&mut self, val: i32) -> Option<Box<&mut ListNode>> {
        self.val = val;
        Some(Box::new(self))
    }
    pub fn to_array(head: Option<Box<ListNode>>) -> Vec<i32> {
        let mut result = Vec::new();
        let mut current = head;
        while let Some(node) = current {
            result.push(node.val);
            current = node.next;
        }
        result
    }
    pub fn from_array(nums: &[i32]) -> Option<Box<ListNode>> {
        if nums.is_empty() {
            return None;
        }
        let mut head: Option<Box<ListNode>> = None;
        let mut current = &mut head;
        for &val in nums.iter() {
            let node = Box::new(ListNode { val, next: None });
            *current = Some(node);
            current = &mut current.as_mut().unwrap().next;
        }
        head
    }
}

pub fn reverse_linked_list(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
    let mut current: Option<Box<ListNode>> = head;
    let mut previous: Option<Box<ListNode>> = None;
    while let Some(mut node) = current {
        current = node.next;
        node.next = previous;
        previous = Some(node);
    }
    previous
}
#[cfg(test)]
mod tests {
    use crate::easy::reverse_linked_list::ListNode;

    use super::reverse_linked_list;
    use rstest::rstest;

    #[rstest]
    #[case(vec![1,2,3,4,5], vec![5,4,3,2,1])]
    #[case(vec![1,2], vec![2,1])]
    #[case(vec![], vec![])]
    fn test_reverse_linked_list(#[case] nums: Vec<i32>, #[case] expected: Vec<i32>) {
        let input = ListNode::from_array(&nums);
        let result = reverse_linked_list(input);
        let comparable = ListNode::to_array(result);
        assert_eq!(comparable, expected);
    }
}
