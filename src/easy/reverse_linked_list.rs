#[derive(PartialEq, Eq, Clone, Debug)]
pub struct StrictListNode {
    pub val: i32,
    pub next: Option<Box<StrictListNode>>,
}
#[derive(PartialEq, Eq, Clone, Debug)]
pub struct GenericStrictListNode<T> {
    pub val: T,
    pub next: Option<Box<GenericStrictListNode<T>>>,
}

impl StrictListNode {
    pub fn new() -> Self {
        StrictListNode { val: 0, next: None }
    }
    pub fn create(val: i32) -> StrictListNode {
        StrictListNode { val, next: None }
    }
    pub fn set_value(&mut self, val: i32) -> Option<Box<&mut StrictListNode>> {
        self.val = val;
        Some(Box::new(self))
    }
    pub fn to_array(head: Option<Box<StrictListNode>>) -> Vec<i32> {
        let mut result = Vec::new();
        let mut current = head;
        while let Some(node) = current {
            result.push(node.val);
            current = node.next;
        }
        result
    }
    pub fn from_array(nums: &[i32]) -> Option<Box<StrictListNode>> {
        if nums.is_empty() {
            return None;
        }
        let mut head: Option<Box<StrictListNode>> = None;
        let mut current = &mut head;
        for &val in nums.iter() {
            let node = Box::new(StrictListNode { val, next: None });
            *current = Some(node);
            current = &mut current.as_mut().unwrap().next;
        }
        head
    }
}

pub fn reverse_linked_list(head: Option<Box<StrictListNode>>) -> Option<Box<StrictListNode>> {
    let mut current: Option<Box<StrictListNode>> = head;
    let mut previous: Option<Box<StrictListNode>> = None;
    while let Some(mut node) = current {
        current = node.next;
        node.next = previous;
        previous = Some(node);
    }
    previous
}
#[cfg(test)]
mod tests {
    use crate::easy::reverse_linked_list::StrictListNode;

    use super::reverse_linked_list;
    use rstest::rstest;

    #[rstest]
    #[case(vec![1,2,3,4,5], vec![5,4,3,2,1])]
    #[case(vec![1,2], vec![2,1])]
    #[case(vec![], vec![])]
    fn test_reverse_linked_list(#[case] nums: Vec<i32>, #[case] expected: Vec<i32>) {
        let input = StrictListNode::from_array(&nums);
        let result = reverse_linked_list(input);
        let comparable = StrictListNode::to_array(result);
        assert_eq!(comparable, expected);
    }
}
