use crate::helpers::tree_node::TreeNode;
use std::cell::RefCell;
use std::rc::Rc;
pub fn leaf_count_in_binary_tree<T>(root: Option<Rc<RefCell<TreeNode<T>>>>) -> i32
where
    T: Copy + Clone,
{
    match root {
        None => 0,
        Some(current) => {
            let node = current.borrow();
            if node.left.is_none() && node.right.is_none() {
                return 1;
            }
            leaf_count_in_binary_tree(node.left.clone())
                + leaf_count_in_binary_tree(node.right.clone())
        }
    }
}
#[cfg(test)]
mod tests {
    use super::leaf_count_in_binary_tree;
    use crate::helpers::tree_node::TreeNode;
    use rstest::rstest;
    use std::cell::RefCell;
    use std::rc::Rc;
    #[rstest]
    #[case("1,10,39,5", 2)]
    #[case("4,8,10,7,x,5,1,3", 3)]
    #[case("50,30,70,20,40,60,80,x,x,x,x,65", 4)]
    #[case("30,25,35,20,28,x,40,x,x,27", 3)]
    #[case("1,2,3,-1,-1,-1,-1", 4)]
    #[case("1,2,3,x,x,x,x", 2)]
    #[case("1,2,3,4,5,x,x,x,x,x,x", 3)]
    #[case("10,20,30,40,50,60,70", 4)]
    #[case("x", 0)]
    #[case("5", 1)]
    #[case("1,x,x", 1)]
    #[case("1,2,x,3,x,4,x,5,x", 1)]
    #[case("1,x,2,x,3,x,4,x,5,x,6", 1)]
    #[case("50,30,70,20,40,60,80,x,x,x,x,x,x,x,x", 4)]
    #[case("1,2,x,3,x,4,x,5,x,6,x,7,x,8,x,9,x,10", 1)]
    #[case("-5,-8,-3,-12,-7,x,x,x,x,x,x", 3)]
    #[case("100000,99999,1,2,x,x,x,3,4,5,6", 4)]
    #[case("-42,42,-42,42,-42,42,-42", 4)]
    #[case("7,x,8,x,9,x,10,x,11,x,12,x,13", 1)]
    #[case("1,2,3,x,x,x,4,x,x,x,x,x,x,x,5", 2)]
    #[case("99999, x, x", 1)]
    fn test_leaf_count_in_binary_tree(#[case] tree: &str, #[case] expected: i32) {
        let nums: Vec<Option<_>> = TreeNode::<i32>::from_string_slice(&tree);
        let root: Option<Rc<RefCell<TreeNode<_>>>> = TreeNode::from_slice(&nums);
        assert_eq!(leaf_count_in_binary_tree(root), expected);
    }
}
