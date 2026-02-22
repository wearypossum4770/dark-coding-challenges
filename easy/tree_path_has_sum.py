from dark_coding_challenges.data_structures.tree_node import TreeNode


def tree_path_has_sum(root: TreeNode | None, target: int) -> bool:
    if root is None:
        return False
    if root.left is None and root.right is None:
        return target == root.val
    remainder = target - root.val
    return tree_path_has_sum(root.left, remainder) or tree_path_has_sum(
        root.right, remainder
    )
