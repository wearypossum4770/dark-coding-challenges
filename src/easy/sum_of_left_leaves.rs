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
