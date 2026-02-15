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

#[cfg(test)]
mod tests {
    use super::max_depth;
    use crate::helpers::tree_node::TreeNode;
    use rstest::rstest;
    use std::cell::RefCell;
    use std::fmt::Debug;
    use std::rc::Rc;
    fn setup_test_max_depth<T>(root: Option<Rc<RefCell<TreeNode<T>>>>, expected: usize)
    where
        T: Debug + PartialEq + Copy,
    {
        let depth = max_depth(root) as usize;
        assert_eq!(depth, expected, "max_depth failed for tree with root");
    }
    #[rstest]
    #[case("3,9,20,x,x,15,7", 3)]
    #[case("1,x,2", 2)]
    #[case("1", 1)]
    #[case("", 0)]
    #[case("1,2,x,3,x,4,x,5", 5)]
    #[case("1,x,2,x,3,x,4,x,5", 5)]
    #[case("1,2,3,4,5,6,7", 3)]
    #[case("1,2,3,4,5,6,x", 3)]
    #[case("5,4,6,3,x,x,7,x,2", 4)]
    #[case("-100,-100,-100,-100,-100", 3)]
    #[case("0", 1)]
    #[case("100", 1)]
    #[case("10,20,x,30,x,40,x,50", 5)]
    fn test_max_depth(#[case] s: &str, #[case] expected: i32) {
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
        assert_eq!(max_depth(root), expected);
    }
}
