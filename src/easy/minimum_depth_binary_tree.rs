use crate::helpers::tree_node::BinaryTree;
use std::{collections::VecDeque, rc::Rc};

pub fn minimum_depth_binary_tree<T>(root: BinaryTree<T>) -> i32 {
    let Some(root_node) = root else {
        return 0;
    };
    let mut queue = VecDeque::new();
    queue.push_back((root_node, 1));
    while let Some((current, depth)) = queue.pop_front() {
        let node = current.borrow();
        if node.left.is_none() && node.right.is_none() {
            return depth;
        }
        if let Some(left) = &node.left {
            queue.push_back((Rc::clone(left), depth + 1));
        }
        if let Some(right) = &node.right {
            queue.push_back((Rc::clone(right), depth + 1));
        }
    }
    0
}
