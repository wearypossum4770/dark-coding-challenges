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
