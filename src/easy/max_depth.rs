use crate::helpers::tree_node::TreeNode;
use std::cell::RefCell;
use std::rc::Rc;

pub fn max_depth<T>(root: Option<Rc<RefCell<TreeNode<T>>>>) -> i32
where
    T: Copy,
{
    root.map_or(0, |node| {
        let borrowed = node.borrow();
        let left = max_depth(borrowed.left.clone());
        let right = max_depth(borrowed.right.clone());
        1 + left.max(right)
    })
}
