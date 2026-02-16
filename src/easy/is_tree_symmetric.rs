use crate::helpers::tree_node::TreeNode;
use std::cell::RefCell;
use std::rc::Rc;

fn check_mirror<T: PartialEq + Copy>(left: Option<Rc<RefCell<TreeNode<T>>>>, right: Option<Rc<RefCell<TreeNode<T>>>>) -> bool {
	match (left, right) {
		(None, None) => true,
		(Some(_), None) | (None, Some(_)) => false,
		(Some(l), Some(r)) => {
		 let lb = l.borrow();
		 let rb = r.borrow();
		 lb.val == rb.val && check_mirror(lb.left.clone(), rb.right.clone()) && check_mirror(lb.right.clone(),rb.left.clone())
		}
	}
}
pub fn is_tree_symmetric<T>(root: Option<Rc<RefCell<TreeNode<T>>>>) -> bool  where  T: Copy + Clone + PartialEq{
	match root {
		None => true,
		Some(node) => {
			let n = node.borrow();
			check_mirror(n.left.clone(), n.right.clone())
		}
	}
	
}
