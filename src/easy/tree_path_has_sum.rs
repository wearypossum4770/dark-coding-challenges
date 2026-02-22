use crate::helpers::tree_node::TreeNode;
use std::cell::RefCell;
use std::rc::Rc;

pub fn tree_path_has_sum(root: Option<Rc<RefCell<TreeNode<i32>>>>, target_sum: i32) -> bool {
    match root {
        None => false,
        Some(current) => {
            let node = current.borrow();
            let remainder = target_sum - node.val;
            if node.left.is_none() && node.right.is_none() {
                return target_sum == node.val;
            }
            tree_path_has_sum(node.left.clone(), remainder)
                || tree_path_has_sum(node.right.clone(), remainder)
        }
    }
}

