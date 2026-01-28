use crate::helpers::tree_node::TreeNode;
use std::cell::RefCell;
use std::rc::Rc;

pub fn sum_of_left_leaves(root: Option<Rc<RefCell<TreeNode<i32>>>>) -> i32 {
    let mut count: i32 = 0;
    let mut stack: Vec<(Option<Rc<RefCell<TreeNode<i32>>>>, bool)> = vec![(root, false)];
    while !stack.is_empty() {
        if let Some(pair) = stack.pop() {
            match pair.0 {
                Some(node) => {
                    let current = node.borrow();
                    if current.left.is_none() && current.right.is_none() && pair.1 {
                        count += current.val;
                    }
                    if current.left.is_some() {
                        stack.push((current.left.clone(), true));
                    }
                    if current.right.is_some() {
                        stack.push((current.right.clone(), false));
                    }
                }
                None => continue,
            }
        };
    }
    count
}
#[cfg(test)]
mod tests {
    use crate::helpers::tree_node::TreeNode;

    use super::sum_of_left_leaves;
    use rstest::rstest;
    #[rstest]
    #[case(&[], 0)]
    #[case(&[Some(1)], 0)]
    #[case(&[Some(1),Some(2)], 2)]
    #[case(&[Some(1),None,Some(3)], 0)]
    #[case(&[Some(1),Some(2),Some(3)], 2)]
    #[case(&[Some(3),Some(9),Some(20),None,None,Some(15),Some(7)], 24)]
    #[case(&[Some(1),Some(2),None,Some(3),None,Some(4)], 4)]
    #[case(&[Some(1),None,Some(2),None,Some(3),None,Some(4)], 0)]
    #[case(&[Some(1),Some(2),Some(3),Some(4),Some(5)], 4)]
    #[case(&[Some(1),Some(2),Some(3),None,Some(4)], 0)]
    #[case(&[Some(0),Some(-1),Some(-2)], -1)]
    #[case(&[Some(1),Some(2),None,None,Some(3)], 0)]
    #[case(&[Some(1),None,Some(2),Some(3)], 3)]
    #[case(&[Some(1),Some(2),Some(3),Some(4),None,None,Some(5)], 4)]

    fn test_sum_of_left_leaves(#[case] nums: &[Option<i32>], #[case] expected: i32) {
        assert_eq!(sum_of_left_leaves(TreeNode::from_slice(nums)), expected);
    }
}
