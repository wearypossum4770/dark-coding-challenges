use crate::helpers::tree_node::TreeNode;
use std::cell::RefCell;
use std::rc::Rc;

fn check_mirror<T: PartialEq + Copy>(
    left: Option<Rc<RefCell<TreeNode<T>>>>,
    right: Option<Rc<RefCell<TreeNode<T>>>>,
) -> bool {
    match (left, right) {
        (None, None) => true,
        (Some(_), None) | (None, Some(_)) => false,
        (Some(l), Some(r)) => {
            let lb = l.borrow();
            let rb = r.borrow();
            lb.val == rb.val
                && check_mirror(lb.left.clone(), rb.right.clone())
                && check_mirror(lb.right.clone(), rb.left.clone())
        }
    }
}
pub fn is_tree_symmetric<T>(root: Option<Rc<RefCell<TreeNode<T>>>>) -> bool
where
    T: Copy + Clone + PartialEq,
{
    match root {
        None => true,
        Some(node) => {
            let n = node.borrow();
            check_mirror(n.left.clone(), n.right.clone())
        }
    }
}
#[cfg(test)]
mod tests {
    use super::is_tree_symmetric;
    use crate::helpers::tree_node::TreeNode;
    use rstest::rstest;

    #[rstest]
    #[case("1,2,2,3,4,4,3,5,6,7,8,8,7,6,5", true)]
    #[case("1,2,2,3,4,4,3", true)]
    #[case("", true)]
    #[case("1", true)]
    #[case("1,2,2", true)]
    #[case("1,2,3", false)]
    #[case("1,2,2,3,4,4,3", true)]
    #[case("1,2,2,3,4,4,5", false)]
    #[case("1,2,2,3,null,null,3", true)]
    #[case("1,2,2,null,3,null,3", false)]
    #[case("1,2,2,3,3,null,null", false)]
    #[case("1,null,null", true)]
    #[case("1,2,null", false)]
    #[case("1,null,2", false)]
    #[case("1,2,2,3,4,null,4,5,6,null,null,6,5", false)]
    #[case("1,2,2,3,4,null,4,5,6,null,null,7,5", false)]
    #[case("0", true)]
    #[case("0,0,0", true)]
    #[case("0,0,1", false)]
    #[case("1,2,2,2,2,2,2", true)]
    #[case("1,2,3,4,5,6,7", false)]
    #[case("1,2,2,3,3,3,3,4,4,4,4,4,4,4,4", true)]
    #[case("5,4,4,3,3,3,3,2,2,2,2,2,2,2,2", true)]
    #[case("1,2,null,3,null,null,null", false)]
    #[case("1,null,null,null,null,null,null", true)]
    #[case("2,3,3,4,5,5,4,6,7,8,8,7,6", false)]
    #[case("1,2,2,3,4,4,3,5,6,7,8,8,7,6,5", true)]
    #[case("1,2,2,3,4,4,3,5,6,7,8,8,7,6,6", false)]
    #[case("1,1,1,1,1,1,1,1,1,1,1,1,1,1,1", true)]
    fn test_is_tree_symmetric(#[case] s: &str, #[case] expected: bool) {
        let nums = s
            .split(",")
            .map(|c| {
                let trimmed = c.trim();
                if trimmed.is_empty()
                    || trimmed.eq_ignore_ascii_case("x")
                    || trimmed.eq_ignore_ascii_case("null")
                {
                    None
                } else {
                    trimmed.parse::<i32>().ok()
                }
            })
            .collect::<Vec<Option<i32>>>();
        let root = TreeNode::from_slice(&nums);
        assert_eq!(is_tree_symmetric(root), expected);
    }
}
