use crate::helpers::tree_node::TreeNode;
use std::cell::RefCell;
use std::collections::VecDeque;
use std::rc::Rc;

pub fn level_order_traversal<T>(root: Option<Rc<RefCell<TreeNode<T>>>>) -> Vec<Vec<T>>
where
    T: Copy,
{
    let mut result = Vec::new();
    if root.is_none() {
        return result;
    }
    let mut queue: VecDeque<Rc<RefCell<TreeNode<T>>>> = VecDeque::new();
    queue.push_back(root.unwrap());
    while !queue.is_empty() {
        let size = queue.len();
        let mut current: Vec<T> = Vec::with_capacity(size);
        for _ in 0..size {
            if let Some(n) = queue.pop_front() {
                let node = n.borrow();
                current.push(node.val);
                if let Some(left) = &node.left {
                    queue.push_back(left.clone());
                }
                if let Some(right) = &node.right {
                    queue.push_back(right.clone());
                }
            }
        }
        result.push(current);
    }
    result
}
