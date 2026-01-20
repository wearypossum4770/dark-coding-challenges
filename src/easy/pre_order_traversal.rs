use crate::helpers::tree_node::TreeNode;

use std::cell::RefCell;
use std::rc::Rc;

pub fn pre_order_traversal<T>(root: Option<Rc<RefCell<TreeNode<T>>>>) -> Vec<T>
where
    T: Copy,
{
    let mut result: Vec<T> = Vec::new();

    let Some(root) = root else { return result };

    let mut stack = vec![root];
    while let Some(current) = stack.pop() {
        let node = current.borrow();
        result.push(node.val);
        if let Some(right) = node.get_right() {
            stack.push(right);
        }
        if let Some(left) = node.get_left() {
            stack.push(left);
        }
    }
    result
}

#[cfg(test)]
mod tests {
    use super::pre_order_traversal;
    use crate::helpers::tree_node::TreeNode;
    use rstest::rstest;
    #[rstest]
    #[case(&[], &[], "Empty tree")]
    #[case(&[None], &[], "Single null node")]
    #[case(&[Some(1)], &[1], "Single node")]
    #[case(&[Some(0)], &[0], "Single zero node")]
    #[case(&[Some(1),Some(2)], &[1,2], "Root with left child only")]
    #[case(&[Some(1),None,Some(2)], &[1,2], "Root with right child only")]
    #[case(&[Some(1),Some(2),Some(3)], &[1,2,3], "Complete tree depth 1")]
    #[case(&[Some(1),Some(2),None,Some(3),None,Some(4)], &[1,2,3,4], "Left-skewed tree")]
    #[case(&[Some(1),None,Some(2),None,Some(3),None,Some(4)], &[1,2,3,4], "Right-skewed tree")]
    #[case(&[Some(1),Some(2),None,Some(3),None,Some(4),None,Some(5)], &[1,2,3,4,5], "Deep left-skewed tree")]
    #[case(&[Some(1),Some(2),Some(3),Some(4),Some(5),Some(6),Some(7)], &[1,2,4,5,3,6,7], "Complete binary tree depth 2")]
    #[case(&[Some(100),Some(50),Some(150),Some(25),Some(75),Some(125),Some(175)], &[100,50,25,75,150,125,175], "Balanced BST structure")]
    #[case(&[Some(1),Some(2),Some(3),None,None,Some(4),Some(5)], &[1,2,3,4,5], "Nulls in middle level")]
    #[case(&[Some(1),Some(2),Some(3),None,Some(4),None,Some(5)], &[1,2,4,3,5], "Alternating nulls")]
    #[case(&[Some(1),Some(2),Some(3),Some(4),None,None,None,Some(5)], &[1,2,4,5,3], "Deep left child only")]
    #[case(&[Some(1),None], &[1], "Single trailing null")]
    #[case(&[Some(1),None,None], &[1], "Multiple trailing nulls")]
    #[case(&[Some(1),Some(2),Some(3),None,None,None,None], &[1,2,3], "Complete tree with trailing nulls")]
    #[case(&[Some(-50),None,Some(50),None,None,Some(-25),Some(75)], &[-50,50], "Extra values after complete branches (orphaned)")]
    #[case(&[Some(-1),None,Some(-2),None,Some(-3)], &[-1,-2,-3], "Right-skewed negative numbers")]
    #[case(&[Some(-10),Some(-20),Some(-30),Some(-40),Some(-50)], &[-10,-20,-40,-50,-30], "Complete tree with negatives")]
    #[case(&[Some(-50),None,Some(50),Some(-25),Some(75)], &[-50,50,-25,75], "Mixed negative and positive")]
    #[case(&[Some(0),Some(0),Some(0),Some(0),Some(0)], &[0,0,0,0,0], "All zeros")]
    #[case(&[Some(0),Some(-1),Some(1),Some(-2),Some(2),Some(-3),Some(3)], &[0,-1,-2,2,1,-3,3], "Zero root with mixed values")]
    #[case(&[Some(1),Some(1),Some(1),Some(1),Some(1),Some(1),Some(1)], &[1,1,1,1,1,1,1], "All duplicate values")]
    #[case(&[Some(-2147483648),None,Some(2147483647)], &[-2147483648,2147483647], "Min and max 32-bit integers")]
    #[case(&[Some(10),Some(5),Some(15),Some(3),Some(7),None,Some(20)], &[10,5,3,7,15,20], "BST structure with missing node")]
    #[case(&[Some(5),Some(3),Some(8),Some(1),Some(4),None,Some(9),None,Some(2)], &[5,3,1,2,4,8,9], "Complex asymmetric tree")]
    #[case(&[Some(1),Some(2),Some(3),Some(4),None,Some(5),Some(6),None,None,None,None,Some(7)], &[1,2,4,3,5,6,7], "Mixed depth with sparse nulls")]
    #[case(&[Some(1),None,Some(2),Some(3)], &[1,2,3], "Right child with left grandchild")]
    #[case(&[Some(1),Some(2),None,None,Some(3),None,Some(4),None,Some(5)], &[1,2,3,4,5], "Zigzag pattern")]
    #[case(&[Some(1),None,Some(2),Some(3),None,Some(4),None,Some(5)], &[1,2,3,4,5], "Right-heavy zigzag")]
    #[case(&[Some(1),Some(2),None,Some(3),Some(4),None,None,Some(5),Some(6)], &[1,2,3,4,5,6], "Left subtree with deep right branches")]
    #[case(&[Some(10),Some(5),None,Some(3),None,Some(7),None,Some(1)], &[10,5,3,7,1], "Left child with alternating pattern")]
    #[case(&[Some(1),Some(2),Some(3),None,None,None,Some(4)], &[1,2,3,4], "Right child of right child only")]
    #[case(&[Some(1),Some(2),None,Some(3),None,Some(4),None,Some(5),None,Some(6),None,Some(7),None,Some(8),None,Some(9),None,Some(10)], &[1,2,3,4,5,6,7,8,9,10], "Very deep left-skewed (10 levels)")]
    #[case(&[Some(1),None,Some(2),None,Some(3),None,Some(4),None,Some(5),None,Some(6),None,Some(7),None,Some(8),None,Some(9),None,Some(10)], &[1,2,3,4,5,6,7,8,9,10], "Very deep right-skewed (10 levels)")]
    #[case(&[Some(1),Some(2),Some(3),Some(4),Some(5),Some(6),Some(7),Some(8),Some(9),Some(10),Some(11),Some(12),Some(13),Some(14),Some(15)], &[1,2,4,8,9,5,10,11,3,6,12,13,7,14,15], "Complete binary tree depth 3 (15 nodes)")]
    #[case(&[Some(1),None,None,None,Some(2)], &[1], "Orphaned node after nulls")]
    #[case(&[Some(1),Some(2),Some(3),None,None,None,None,None,None,Some(4)], &[1,2,3], "Node far beyond tree structure")]

    fn test_pre_order_traversal(
        #[case] nums: &[Option<i32>],
        #[case] expected: &[i32],
        #[case] criteria: &str,
    ) {
        let root = TreeNode::from_slice(nums);
        assert_eq!(pre_order_traversal(root), expected.to_vec());
    }
}
