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
