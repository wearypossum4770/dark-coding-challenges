use crate::helpers::tree_node::BinaryTree;

pub fn level_order_bottom(root: BinaryTree<i32>) -> Vec<Vec<i32>> {
    let mut result: Vec<Vec<i32>> = Vec::new();

    let mut queue = vec![root];
    while !queue.is_empty() {
        let size = queue.len();

        let mut current: Vec<i32> = Vec::new();

        for _ in 0..size {
            if let Some(node) = queue.remove(0) {
                let leaf = node.borrow();
                current.push(leaf.val);
                queue.push(leaf.get_left());
                queue.push(leaf.get_right());
            }
        }
        if !current.is_empty() {
            result.insert(0, current);
        }
    }
    result
}
